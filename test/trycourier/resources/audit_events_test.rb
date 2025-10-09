# frozen_string_literal: true

require_relative "../test_helper"

class Trycourier::Test::Resources::AuditEventsTest < Trycourier::Test::ResourceTest
  def test_retrieve
    skip("Prism tests are disabled")

    response = @courier.audit_events.retrieve("audit-event-id")

    assert_pattern do
      response => Trycourier::AuditEvent
    end

    assert_pattern do
      response => {
        actor: Trycourier::AuditEvent::Actor,
        audit_event_id: String,
        source: String,
        target: String,
        timestamp: String,
        type: String
      }
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @courier.audit_events.list

    assert_pattern do
      response => Trycourier::Models::AuditEventListResponse
    end

    assert_pattern do
      response => {
        paging: Trycourier::Paging,
        results: ^(Trycourier::Internal::Type::ArrayOf[Trycourier::AuditEvent])
      }
    end
  end
end
