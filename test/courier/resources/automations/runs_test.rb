# frozen_string_literal: true

require_relative "../../test_helper"

class Courier::Test::Resources::Automations::RunsTest < Courier::Test::ResourceTest
  def test_list
    skip("Mock server tests are disabled")

    response = @courier.automations.runs.list

    assert_pattern do
      response => Courier::AutomationRunListResponse
    end

    assert_pattern do
      response => {
        runs: ^(Courier::Internal::Type::ArrayOf[Courier::AutomationRunListItem]),
        next_cursor: String | nil
      }
    end
  end

  def test_list_steps
    skip("Mock server tests are disabled")

    response = @courier.automations.runs.list_steps("x")

    assert_pattern do
      response => Courier::AutomationRunStepsResponse
    end

    assert_pattern do
      response => {
        steps: ^(Courier::Internal::Type::ArrayOf[Courier::AutomationRunStep])
      }
    end
  end
end
