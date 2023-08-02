require_relative "spec_helper"

RSpec.describe Courier::AuthTokens do
  let(:client) { Courier::Client.new(AUTH_TOKEN_MOCK) }

  context "issue auth token" do
    it "should issue an auth token request" do
      stub_request(:post, "https://api.courier.com/auth/issue-token")
        .with(
          body: {"scope" => "user_id:user_id_you_want_to_create_scope_for read:messages"},
          headers: TOKEN_AUTH_HEADERS
        )
        .to_return(body: "{\"token\": \"5e2b2615.05efbb3acab9172f88dd3f6f\"}", status: 200)

      res = client.auth_tokens.issue_token(scope: "user_id:user_id_you_want_to_create_scope_for read:messages")

      expect(res).to eq({"token" => "5e2b2615.05efbb3acab9172f88dd3f6f"})
    end
  end
end
