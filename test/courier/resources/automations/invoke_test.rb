# frozen_string_literal: true

require_relative "../../test_helper"

class Courier::Test::Resources::Automations::InvokeTest < Courier::Test::ResourceTest
  def test_invoke_ad_hoc_required_params
    skip("Prism tests are disabled")

    response =
      @courier.automations.invoke.invoke_ad_hoc(
        automation: {
          steps: [
            {
              action: :"add-to-digest",
              subscription_topic_id: "RAJE97CMT04KDJJ88ZDS2TP1690S"
            }
          ]
        }
      )

    assert_pattern do
      response => Courier::Automations::AutomationInvokeResponse
    end

    assert_pattern do
      response => {
        run_id: String
      }
    end
  end

  def test_invoke_by_template
    skip("Prism tests are disabled")

    response = @courier.automations.invoke.invoke_by_template("templateId")

    assert_pattern do
      response => Courier::Automations::AutomationInvokeResponse
    end

    assert_pattern do
      response => {
        run_id: String
      }
    end
  end
end
