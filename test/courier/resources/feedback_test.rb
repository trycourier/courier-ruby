# frozen_string_literal: true

require_relative "../test_helper"

class Courier::Test::Resources::FeedbackTest < Courier::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @courier.feedback.create(
        category: :possible_bug,
        description: "GET /lists/{list_id}/subscriptions returned items: [] with paging.more set to true, and following the cursor returned the remaining subscribers.",
        surface: :api,
        title: "List subscriptions returns an empty page with a next cursor"
      )

    assert_pattern do
      response => Courier::Models::FeedbackCreateResponse
    end

    assert_pattern do
      response => {
        feedback_id: String
      }
    end
  end
end
