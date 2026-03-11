# frozen_string_literal: true

require_relative "../test_helper"

class Courier::Test::Resources::JourneysTest < Courier::Test::ResourceTest
  def test_list
    skip("Mock server tests are disabled")

    response = @courier.journeys.list

    assert_pattern do
      response => Courier::JourneysListResponse
    end

    assert_pattern do
      response => {
        cursor: String | nil,
        templates: ^(Courier::Internal::Type::ArrayOf[Courier::Journey]) | nil
      }
    end
  end

  def test_invoke
    skip("Mock server tests are disabled")

    response = @courier.journeys.invoke("templateId")

    assert_pattern do
      response => Courier::JourneysInvokeResponse
    end

    assert_pattern do
      response => {
        run_id: String
      }
    end
  end
end
