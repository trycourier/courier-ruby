# frozen_string_literal: true

module Trycourier
  module Resources
    class AuditEvents
      # Fetch a specific audit event by ID.
      #
      # @overload retrieve(audit_event_id, request_options: {})
      #
      # @param audit_event_id [String] A unique identifier associated with the audit event you wish to retrieve
      #
      # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Trycourier::Models::AuditEvent]
      #
      # @see Trycourier::Models::AuditEventRetrieveParams
      def retrieve(audit_event_id, params = {})
        @client.request(
          method: :get,
          path: ["audit-events/%1$s", audit_event_id],
          model: Trycourier::AuditEvent,
          options: params[:request_options]
        )
      end

      # Fetch the list of audit events
      #
      # @overload list(cursor: nil, request_options: {})
      #
      # @param cursor [String, nil] A unique identifier that allows for fetching the next set of audit events.
      #
      # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Trycourier::Models::AuditEventListResponse]
      #
      # @see Trycourier::Models::AuditEventListParams
      def list(params = {})
        parsed, options = Trycourier::AuditEventListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "audit-events",
          query: parsed,
          model: Trycourier::Models::AuditEventListResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [Trycourier::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
