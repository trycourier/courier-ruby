# frozen_string_literal: true

require_relative "../test_helper"

class Trycourier::Test::Resources::AutomationsTest < Trycourier::Test::ResourceTest
  def test_list
    skip("Prism tests are disabled")

    response = @courier.automations.list

    assert_pattern do
      response => Trycourier::AutomationTemplateListResponse
    end

    assert_pattern do
      response => {
        cursor: String | nil,
        templates: ^(Trycourier::Internal::Type::ArrayOf[Trycourier::AutomationTemplate]) | nil
      }
    end
  end
end
