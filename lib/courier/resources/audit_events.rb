# frozen_string_literal: true

module Courier
  module Resources
    class AuditEvents
      # Fetch a specific audit event by ID.
      #
      # @overload retrieve(audit_event_id, request_options: {})
      #
      # @param audit_event_id [String] A unique identifier associated with the audit event you wish to retrieve
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::AuditEvent]
      #
      # @see Courier::Models::AuditEventRetrieveParams
      def retrieve(audit_event_id, params = {})
        @client.request(
          method: :get,
          path: ["audit-events/%1$s", audit_event_id],
          model: Courier::AuditEvent,
          options: params[:request_options]
        )
      end

      # Fetch the list of audit events
      #
      # @overload list(cursor: nil, request_options: {})
      #
      # @param cursor [String, nil] A unique identifier that allows for fetching the next set of audit events.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::AuditEventListResponse]
      #
      # @see Courier::Models::AuditEventListParams
      def list(params = {})
        parsed, options = Courier::AuditEventListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "audit-events",
          query: parsed,
          model: Courier::Models::AuditEventListResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [Courier::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
