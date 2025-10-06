# frozen_string_literal: true

require_relative "../test_helper"

class Courier::Test::Resources::InboundTest < Courier::Test::ResourceTest
  def test_track_event_required_params
    skip("Prism tests are disabled")

    response =
      @courier.inbound.track_event(
        event: "New Order Placed",
        message_id: "4c62c457-b329-4bea-9bfc-17bba86c393f",
        properties: {order_id: "bar", total_orders: "bar", last_order_id: "bar"},
        type: :track
      )

    assert_pattern do
      response => Courier::Models::InboundTrackEventResponse
    end

    assert_pattern do
      response => {
        message_id: String
      }
    end
  end
end
