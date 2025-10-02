# frozen_string_literal: true

module Courier
  module Messages
    class Client
      # @return [Courier::Messages::Client]
      def initialize(client:)
        @client = client
      end

      # Fetch the statuses of messages you've previously sent.
      #
      # @return [Courier::Messages::Types::ListMessagesResponse]
      def list(request_options: {}, **params)
        _query_param_names = [
          %w[archived cursor event list messageId notification provider recipient status
             tag tags tenant_id enqueued_after traceId],
          %i[archived cursor event list messageId notification provider recipient status tag tags tenant_id
             enqueued_after traceId]
        ].flatten
        _query = params.slice(*_query_param_names)
        params.except(*_query_param_names)

        _request = Courier::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Courier::Environment::PRODUCTION,
          method: "GET",
          path: "messages",
          query: _query
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Courier::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Courier::Messages::Types::ListMessagesResponse.load(_response.body)
        else
          error_class = Courier::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Fetch the status of a message you've previously sent.
      #
      # @return [Courier::Messages::Types::MessageDetailsExtended]
      def get(request_options: {}, **params)
        _request = Courier::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Courier::Environment::PRODUCTION,
          method: "GET",
          path: "messages/#{params[:message_id]}"
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Courier::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Courier::Messages::Types::MessageDetailsExtended.load(_response.body)
        else
          error_class = Courier::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Cancel a message that is currently in the process of being delivered. A well-formatted API call to the cancel message API will return either `200` status code for a successful cancellation or `409` status code for an unsuccessful cancellation. Both cases will include the actual message record in the response body (see details below).
      #
      # @return [Courier::Messages::Types::MessageDetails]
      def cancel(request_options: {}, **params)
        _request = Courier::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Courier::Environment::PRODUCTION,
          method: "POST",
          path: "messages/#{params[:message_id]}/cancel"
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Courier::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Courier::Messages::Types::MessageDetails.load(_response.body)
        else
          error_class = Courier::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Fetch the array of events of a message you've previously sent.
      #
      # @return [Courier::Messages::Types::MessageHistoryResponse]
      def get_history(request_options: {}, **params)
        _query_param_names = [
          ["type"],
          %i[type]
        ].flatten
        _query = params.slice(*_query_param_names)
        params = params.except(*_query_param_names)

        _request = Courier::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Courier::Environment::PRODUCTION,
          method: "GET",
          path: "messages/#{params[:message_id]}/history",
          query: _query
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Courier::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Courier::Messages::Types::MessageHistoryResponse.load(_response.body)
        else
          error_class = Courier::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # @return [Courier::Messages::Types::RenderOutputResponse]
      def get_content(request_options: {}, **params)
        _request = Courier::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Courier::Environment::PRODUCTION,
          method: "GET",
          path: "messages/#{params[:message_id]}/output"
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Courier::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Courier::Messages::Types::RenderOutputResponse.load(_response.body)
        else
          error_class = Courier::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # @return [untyped]
      def archive(request_options: {}, **params)
        _request = Courier::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Courier::Environment::PRODUCTION,
          method: "PUT",
          path: "requests/#{params[:request_id]}/archive"
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Courier::Errors::TimeoutError
        end
        code = _response.code.to_i
        return if code.between?(200, 299)

        error_class = Courier::Errors::ResponseError.subclass_for_code(code)
        raise error_class.new(_response.body, code: code)
      end
    end
  end
end
