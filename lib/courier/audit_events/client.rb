# frozen_string_literal: true

module Courier
  module AuditEvents
    class Client
      # @return [Courier::AuditEvents::Client]
      def initialize(client:)
        @client = client
      end

      # Fetch the list of audit events
      #
      # @return [Courier::AuditEvents::Types::ListAuditEventsResponse]
      def list(request_options: {}, **params)
        _query_param_names = [
          ["cursor"],
          %i[cursor]
        ].flatten
        _query = params.slice(*_query_param_names)
        params.except(*_query_param_names)

        _request = Courier::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Courier::Environment::PRODUCTION,
          method: "GET",
          path: "/audit-events",
          query: _query
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Courier::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Courier::AuditEvents::Types::ListAuditEventsResponse.load(_response.body)
        else
          error_class = Courier::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Fetch a specific audit event by ID.
      #
      # @return [Courier::AuditEvents::Types::AuditEvent]
      def get(request_options: {}, **params)
        _request = Courier::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Courier::Environment::PRODUCTION,
          method: "GET",
          path: "/audit-events/#{params[:audit - event - id]}"
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Courier::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Courier::AuditEvents::Types::AuditEvent.load(_response.body)
        else
          error_class = Courier::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end
    end
  end
end
