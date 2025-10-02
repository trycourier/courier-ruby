# frozen_string_literal: true

module Courier
  module Lists
    class Client
      # @return [Courier::Lists::Client]
      def initialize(client:)
        @client = client
      end

      # Returns all of the lists, with the ability to filter based on a pattern.
      #
      # @return [Courier::Lists::Types::ListGetAllResponse]
      def list(request_options: {}, **params)
        _query_param_names = [
          %w[cursor pattern],
          %i[cursor pattern]
        ].flatten
        _query = params.slice(*_query_param_names)
        params.except(*_query_param_names)

        _request = Courier::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Courier::Environment::PRODUCTION,
          method: "GET",
          path: "/lists",
          query: _query
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Courier::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Courier::Lists::Types::ListGetAllResponse.load(_response.body)
        else
          error_class = Courier::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Returns a list based on the list ID provided.
      #
      # @return [Courier::Lists::Types::List]
      def get(request_options: {}, **params)
        _request = Courier::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Courier::Environment::PRODUCTION,
          method: "GET",
          path: "/lists/#{params[:list_id]}"
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Courier::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Courier::Lists::Types::List.load(_response.body)
        else
          error_class = Courier::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Create or replace an existing list with the supplied values.
      #
      # @return [untyped]
      def update(request_options: {}, **params)
        _request = Courier::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Courier::Environment::PRODUCTION,
          method: "PUT",
          path: "/lists/#{params[:list_id]}",
          body: Courier::Lists::Types::ListPutParams.new(params).to_h
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

      # Delete a list by list ID.
      #
      # @return [untyped]
      def delete(request_options: {}, **params)
        _request = Courier::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Courier::Environment::PRODUCTION,
          method: "DELETE",
          path: "/lists/#{params[:list_id]}"
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

      # Restore a previously deleted list.
      #
      # @return [untyped]
      def restore(request_options: {}, **params)
        _path_param_names = ["list_id"]

        _request = Courier::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Courier::Environment::PRODUCTION,
          method: "PUT",
          path: "/lists/#{params[:list_id]}/restore",
          body: params.except(*_path_param_names)
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

      # Get the list's subscriptions.
      #
      # @return [Courier::Lists::Types::ListGetSubscriptionsResponse]
      def get_subscribers(request_options: {}, **params)
        _query_param_names = [
          ["cursor"],
          %i[cursor]
        ].flatten
        _query = params.slice(*_query_param_names)
        params = params.except(*_query_param_names)

        _request = Courier::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Courier::Environment::PRODUCTION,
          method: "GET",
          path: "/lists/#{params[:list_id]}/subscriptions",
          query: _query
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Courier::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Courier::Lists::Types::ListGetSubscriptionsResponse.load(_response.body)
        else
          error_class = Courier::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Subscribes the users to the list, overwriting existing subscriptions. If the list does not exist, it will be automatically created.
      #
      # @return [untyped]
      def update_subscribers(request_options: {}, **params)
        _path_param_names = ["list_id"]

        _request = Courier::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Courier::Environment::PRODUCTION,
          method: "PUT",
          path: "/lists/#{params[:list_id]}/subscriptions",
          body: params.except(*_path_param_names)
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

      # Subscribes additional users to the list, without modifying existing subscriptions. If the list does not exist, it will be automatically created.
      #
      # @return [untyped]
      def add_subscribers(request_options: {}, **params)
        _path_param_names = ["list_id"]

        _request = Courier::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Courier::Environment::PRODUCTION,
          method: "POST",
          path: "/lists/#{params[:list_id]}/subscriptions",
          body: params.except(*_path_param_names)
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

      # Subscribe a user to an existing list (note: if the List does not exist, it will be automatically created).
      #
      # @return [untyped]
      def subscribe(request_options: {}, **params)
        _path_param_names = %w[list_id user_id]

        _request = Courier::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Courier::Environment::PRODUCTION,
          method: "PUT",
          path: "/lists/#{params[:list_id]}/subscriptions/#{params[:user_id]}",
          body: params.except(*_path_param_names)
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

      # Delete a subscription to a list by list ID and user ID.
      #
      # @return [untyped]
      def unsubscribe(request_options: {}, **params)
        _request = Courier::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Courier::Environment::PRODUCTION,
          method: "DELETE",
          path: "/lists/#{params[:list_id]}/subscriptions/#{params[:user_id]}"
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
