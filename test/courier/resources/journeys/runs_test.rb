# frozen_string_literal: true

require_relative "../../test_helper"

class Courier::Test::Resources::Journeys::RunsTest < Courier::Test::ResourceTest
  def test_retrieve
    skip("Mock server tests are disabled")

    response = @courier.journeys.runs.retrieve("x")

    assert_pattern do
      response => Courier::JourneyRunResponse
    end

    assert_pattern do
      response => {
        run: Courier::JourneyRun
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @courier.journeys.runs.list

    assert_pattern do
      response => Courier::JourneyRunListResponse
    end

    assert_pattern do
      response => {
        runs: ^(Courier::Internal::Type::ArrayOf[Courier::JourneyRunListItem]),
        next_cursor: String | nil,
        prev_cursor: String | nil
      }
    end
  end

  def test_list_steps
    skip("Mock server tests are disabled")

    response = @courier.journeys.runs.list_steps("x")

    assert_pattern do
      response => Courier::JourneyRunStepsResponse
    end

    assert_pattern do
      response => {
        steps: ^(Courier::Internal::Type::ArrayOf[Courier::JourneyRunStep])
      }
    end
  end
end
