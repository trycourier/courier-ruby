# frozen_string_literal: true

require_relative "../test_helper"

class Trycourier::Test::Resources::RequestsTest < Trycourier::Test::ResourceTest
  def test_archive
    skip("Prism tests are disabled")

    response = @courier.requests.archive("request_id")

    assert_pattern do
      response => nil
    end
  end
end
