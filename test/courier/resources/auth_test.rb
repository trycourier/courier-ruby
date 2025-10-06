# frozen_string_literal: true

require_relative "../test_helper"

class Courier::Test::Resources::AuthTest < Courier::Test::ResourceTest
  def test_issue_token_required_params
    skip("Prism tests are disabled")

    response = @courier.auth.issue_token(expires_in: "expires_in", scope: "scope")

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
