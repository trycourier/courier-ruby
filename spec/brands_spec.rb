require_relative "spec_helper"

RSpec.describe Courier::Brands do
  let(:client) { Courier::Client.new(auth_token: AUTH_TOKEN_MOCK) }

  context "list brands" do
    it "lists brands without parameters" do
      stub_request(:get, "https://api.courier.com/brands")
        .with(
          headers: TOKEN_AUTH_HEADERS
        )
        .to_return(body: "{\"paging\": {}, \"results\": []}", status: 200)
      res = client.brands.list
      expect(res).to eq({"paging" => {}, "results" => []})
    end

    it "lists brands with parameters" do
      stub_request(:get, "https://api.courier.com/brands?cursor=1234")
        .with(
          headers: TOKEN_AUTH_HEADERS
        )
        .to_return(body: "{\"paging\": {}, \"results\": []}", status: 200)
      res = client.brands.list(cursor: "1234")
      expect(res).to eq({"paging" => {}, "results" => []})
    end

    it "fails to list brands with exception" do
      stub_request(:get, "https://api.courier.com/brands")
        .with(
          headers: TOKEN_AUTH_HEADERS
        ).to_return(body: "{\"message\": \"an error occurred\"}", status: 400)
      expect { client.brands.list }.to raise_error(Courier::CourierAPIException)
    end
  end

  context "get" do
    it "gets brand" do
      stub_request(:get, "https://api.courier.com/brands/" + BRAND_ID)
        .with(
          headers: TOKEN_AUTH_HEADERS
        ).to_return(body: "{\"status\": \"DELIVERED\"}", status: 200)
      res = client.brands.get(BRAND_ID)
      expect(res).to eq({"status" => "DELIVERED"})
    end

    it "fails to get brand with exception" do
      stub_request(:get, "https://api.courier.com/brands/" + BRAND_ID)
        .with(
          headers: TOKEN_AUTH_HEADERS
        ).to_return(body: "{\"message\": \"an error occurred\"}", status: 400)
      expect { client.brands.get(BRAND_ID) }.to raise_error(Courier::CourierAPIException)
    end
  end

  context "create" do
    it "creates a brand" do
      payload = {"name" => "My Brand", "settings" => {}}
      stub_request(:post, "https://api.courier.com/brands")
        .with(
          body: payload,
          headers: TOKEN_AUTH_HEADERS
        ).to_return(body: "{\"id\": \"1234\", \"name\": \"My Brand\"}", status: 200)
      res = client.brands.create("My Brand", {})
      expect(res).to eq({"id" => "1234", "name" => "My Brand"})
    end

    it "creates a brand with options" do
      payload = {"name" => "My Brand", "settings" => {}, "id" => "1234", "snippets" => {"format" => "handlebars", "name" => "test", "value" => "{{test}}"}}
      stub_request(:post, "https://api.courier.com/brands")
        .with(
          body: payload,
          headers: TOKEN_AUTH_HEADERS
        ).to_return(body: "{\"id\": \"1234\", \"name\": \"My Brand\"}", status: 200)
      res = client.brands.create("My Brand", {}, id: "1234", snippets: {"format" => "handlebars", "name" => "test", "value" => "{{test}}"})
      expect(res).to eq({"id" => "1234", "name" => "My Brand"})
    end

    it "creates a brand with idempotency" do
      idemp_headers = TOKEN_AUTH_HEADERS.merge({"idempotency_key": "idemp_mock"})
      payload = {"name" => "My Brand", "settings" => {}}
      stub_request(:post, "https://api.courier.com/brands")
        .with(
          body: payload,
          headers: idemp_headers
        ).to_return(body: "{\"id\": \"1234\", \"name\": \"My Brand\"}", status: 200)
      res = client.brands.create("My Brand", {}, idempotency_key: "idemp_mock")
      expect(res).to eq({"id" => "1234", "name" => "My Brand"})
    end

    it "fails to create with exception" do
      payload = {"name" => "My Brand", "settings" => {}}
      stub_request(:post, "https://api.courier.com/brands")
        .with(
          body: payload,
          headers: TOKEN_AUTH_HEADERS
        ).to_return(body: "{\"message\": \"an error occurred\"}", status: 400)
      expect { client.brands.create("My Brand", {}) }.to raise_error(Courier::CourierAPIException)
    end
  end

  context "replace" do
    it "replaces a brand" do
      payload = {"name" => "My Brand", "settings" => {}}
      stub_request(:put, "https://api.courier.com/brands/" + BRAND_ID)
        .with(
          body: payload,
          headers: TOKEN_AUTH_HEADERS
        ).to_return(status: 200)
      res = client.brands.replace(BRAND_ID, "My Brand", {})
      expect(res.code.to_i).to eq(200)
    end

    it "replaces a brand with options" do
      payload = {"name" => "My Brand", "settings" => {}, "snippets" => {"format" => "handlebars", "name" => "test", "value" => "{{test}}"}}
      stub_request(:put, "https://api.courier.com/brands/" + BRAND_ID)
        .with(
          body: payload,
          headers: TOKEN_AUTH_HEADERS
        ).to_return(status: 200)
      res = client.brands.replace(BRAND_ID, "My Brand", {}, snippets: {"format" => "handlebars", "name" => "test", "value" => "{{test}}"})
      expect(res.code.to_i).to eq(200)
    end

    it "fails to replace brand with exception" do
      payload = {"name" => "My Brand", "settings" => {}}
      stub_request(:put, "https://api.courier.com/brands/" + BRAND_ID)
        .with(
          body: payload,
          headers: TOKEN_AUTH_HEADERS
        ).to_return(body: "{\"message\": \"an error occurred\"}", status: 400)
      expect { client.brands.replace(BRAND_ID, "My Brand", {}) }.to raise_error(Courier::CourierAPIException)
    end
  end
end
