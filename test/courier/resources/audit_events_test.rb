# frozen_string_literal: true

require_relative "../test_helper"

class Courier::Test::Resources::AuditEventsTest < Courier::Test::ResourceTest
  def test_retrieve
    skip("Prism tests are disabled")

    response = @courier.audit_events.retrieve("audit-event-id")

    assert_pattern do
      response => Courier::AuditEvent
    end

    assert_pattern do
      response => {
        audit_event_id: String,
        source: String,
        timestamp: String,
        type: String,
        actor: Courier::AuditEvent::Actor | nil,
        target: Courier::AuditEvent::Target | nil
      }
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @courier.audit_events.list

    assert_pattern do
      response => Courier::Models::AuditEventListResponse
    end

    assert_pattern do
      response => {
        paging: Courier::Paging,
        results: ^(Courier::Internal::Type::ArrayOf[Courier::AuditEvent])
      }
    end
  end
end
