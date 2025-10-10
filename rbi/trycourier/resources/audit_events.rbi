# typed: strong

module Trycourier
  module Resources
    class AuditEvents
      # Fetch a specific audit event by ID.
      sig do
        params(
          audit_event_id: String,
          request_options: Trycourier::RequestOptions::OrHash
        ).returns(Trycourier::AuditEvent)
      end
      def retrieve(
        # A unique identifier associated with the audit event you wish to retrieve
        audit_event_id,
        request_options: {}
      )
      end

      # Fetch the list of audit events
      sig do
        params(
          cursor: T.nilable(String),
          request_options: Trycourier::RequestOptions::OrHash
        ).returns(Trycourier::Models::AuditEventListResponse)
      end
      def list(
        # A unique identifier that allows for fetching the next set of audit events.
        cursor: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Trycourier::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
