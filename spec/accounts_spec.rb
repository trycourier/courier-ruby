require_relative "spec_helper"

RSpec.describe Courier::Accounts do
  let(:client) { Courier::Client.new(AUTH_TOKEN_MOCK) }

  context "(create | update) account" do
    it "should create or update existing account" do
      stub_request(:put, "https://api.courier.com/accounts/account-1")
        .with(
          body: {
            "name" => "ACME Inc"
          },
          headers: TOKEN_AUTH_HEADERS
        )
        .to_return(body: "{ \"name\": \"ACME Inc\"}", status: 200)

      res = client.accounts.put_account(account_id: "account-1", account: {"name" => "ACME Inc"})

      expect(res).to eq({"name" => "ACME Inc"})
    end
  end

  context "get account" do
    it "should get account by id" do
      stub_request(:get, "https://api.courier.com/accounts/account-1")
        .with(
          body: {},
          headers: TOKEN_AUTH_HEADERS
        )
        .to_return(body: "{ \"name\": \"ACME Inc\"}", status: 200)

      res = client.accounts.get_account(account_id: "account-1")

      expect(res).to eq({
        "name" => "ACME Inc"
      })
    end
  end

  context "get accounts" do
    it "should get accounts" do
      stub_request(:get, "https://api.courier.com/accounts")
        .with(
          body: {},
          headers: TOKEN_AUTH_HEADERS
        )
        .to_return(body: "{ \"items\": [{\"name\": \"ACME Inc\"}], \"has_more\": false }", status: 200)

      res = client.accounts.get_accounts()

      expect(res).to eq({
        "items" => [
          {
            "name" => "ACME Inc"
          }
        ],
        "has_more" => false
      })
    end
  end

  context "delete account" do
    it "should delete an account" do
      stub_request(:delete, "https://api.courier.com/accounts/account-1")
        .with(
          headers: TOKEN_AUTH_HEADERS
        ).to_return(status: 204)
      res = client.accounts.delete_account(account_id: "account-1")
      expect(res.code.to_i).to eq(204)
    end
  end
end
