# frozen_string_literal: true

require_relative "../test_helper"

class Courier::Test::Resources::SendTest < Courier::Test::ResourceTest
  def test_send_message_required_params
    skip("Prism tests are disabled")

    response =
      @courier.send_.send_message(
        message: {content: {body: "Thanks for signing up, {{name}}", title: "Welcome!"}}
      )

    assert_pattern do
      response => Courier::Models::SendSendMessageResponse
    end

    assert_pattern do
      response => {
        request_id: String
      }
    end
  end
end
