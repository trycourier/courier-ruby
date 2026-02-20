# frozen_string_literal: true

require_relative "../test_helper"

class Courier::Test::Resources::AuthTest < Courier::Test::ResourceTest
  def test_issue_token_required_params
    skip("Mock server tests are disabled")

    response =
      @courier.auth.issue_token(
        expires_in: "$YOUR_NUMBER days",
        scope: "user_id:$YOUR_USER_ID write:user-tokens inbox:read:messages inbox:write:events read:preferences write:preferences read:brands"
      )

    assert_pattern do
      response => Courier::Models::AuthIssueTokenResponse
    end

    assert_pattern do
      response => {
        token: String
      }
    end
  end
end
