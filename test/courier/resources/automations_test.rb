# frozen_string_literal: true

require_relative "../test_helper"

class Courier::Test::Resources::AutomationsTest < Courier::Test::ResourceTest
  def test_list
    skip("Prism tests are disabled")

    response = @courier.automations.list

    assert_pattern do
      response => Courier::AutomationTemplateListResponse
    end

    assert_pattern do
      response => {
        cursor: String | nil,
        templates: ^(Courier::Internal::Type::ArrayOf[Courier::AutomationTemplate]) | nil
      }
    end
  end
end
