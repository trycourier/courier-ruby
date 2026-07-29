# typed: strong

module Courier
  module Resources
    # Read the audit trail of configuration and access changes in your workspace.
    class AuditEvents
      # Returns one audit event by id, including the actor who performed it, the target
      # they changed, the source, the event type, and a timestamp.
      sig do
        params(
          audit_event_id: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::AuditEvent)
      end
      def retrieve(
        # A unique identifier associated with the audit event you wish to retrieve
        audit_event_id,
        request_options: {}
      )
      end

      # Returns the workspace's audit event log with cursor paging. Each event records
      # the actor, target, source, type, and timestamp of a change.
      sig do
        params(
          cursor: T.nilable(String),
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::Models::AuditEventListResponse)
      end
      def list(
        # A unique identifier that allows for fetching the next set of audit events.
        cursor: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Courier::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
