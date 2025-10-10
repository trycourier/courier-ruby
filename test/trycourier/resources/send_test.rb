# frozen_string_literal: true

require_relative "../test_helper"

class Trycourier::Test::Resources::SendTest < Trycourier::Test::ResourceTest
  def test_message_required_params
    skip("Prism tests are disabled")

    response = @courier.send_.message(message: {})

    assert_pattern do
      response => Trycourier::Models::SendMessageResponse
    end

    assert_pattern do
      response => {
        request_id: String
      }
    end
  end
end
