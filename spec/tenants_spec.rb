require_relative "spec_helper"

RSpec.describe Courier::Tenants do
  let(:client) { Courier::Client.new(AUTH_TOKEN_MOCK) }

  context "(create | update) tenant" do
    it "should create or update existing tenant" do
      stub_request(:put, "https://api.courier.com/tenants/tenant-1")
        .with(
          body: {
            "name" => "ACME Inc"
          },
          headers: TOKEN_AUTH_HEADERS
        )
        .to_return(body: "{ \"name\": \"ACME Inc\"}", status: 200)

      res = client.tenants.put_tenant(tenant_id: "tenant-1", tenant: {"name" => "ACME Inc"})

      expect(res).to eq({"name" => "ACME Inc"})
    end
  end

  context "get tenant" do
    it "should get tenant by id" do
      stub_request(:get, "https://api.courier.com/tenants/tenant-1")
        .with(
          body: {},
          headers: TOKEN_AUTH_HEADERS
        )
        .to_return(body: "{ \"name\": \"ACME Inc\"}", status: 200)

      res = client.tenants.get_tenant(tenant_id: "tenant-1")

      expect(res).to eq({
        "name" => "ACME Inc"
      })
    end
  end

  context "get tenants" do
    it "should get tenants" do
      stub_request(:get, "https://api.courier.com/tenants")
        .with(
          body: {},
          headers: TOKEN_AUTH_HEADERS
        )
        .to_return(body: "{ \"items\": [{\"name\": \"ACME Inc\"}], \"has_more\": false, \"url\": \"/tenants\" }", status: 200)

      res = client.tenants.get_tenants()

      expect(res).to eq({
        "items" => [
          {
            "name" => "ACME Inc"
          }
        ],
        "has_more" => false,
        "url" => "/tenants"
      })
    end
  end

  context "delete tenant" do
    it "should delete an tenant" do
      stub_request(:delete, "https://api.courier.com/tenants/tenant-1")
        .with(
          headers: TOKEN_AUTH_HEADERS
        ).to_return(status: 204)
      res = client.tenants.delete_tenant(tenant_id: "tenant-1")
      expect(res.code.to_i).to eq(204)
    end
  end
end
