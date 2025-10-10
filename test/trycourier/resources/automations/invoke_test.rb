# frozen_string_literal: true

require_relative "../../test_helper"

class Trycourier::Test::Resources::Automations::InvokeTest < Trycourier::Test::ResourceTest
  def test_invoke_ad_hoc_required_params
    skip("Prism tests are disabled")

    response =
      @courier.automations.invoke.invoke_ad_hoc(automation: {steps: [{action: :delay}, {action: :send}]})

    assert_pattern do
      response => Trycourier::AutomationInvokeResponse
    end

    assert_pattern do
      response => {
        run_id: String
      }
    end
  end

  def test_invoke_by_template_required_params
    skip("Prism tests are disabled")

    response = @courier.automations.invoke.invoke_by_template("templateId", recipient: "recipient")

    assert_pattern do
      response => Trycourier::AutomationInvokeResponse
    end

    assert_pattern do
      response => {
        run_id: String
      }
    end
  end
end
