require_relative "spec_helper"

RSpec.describe Courier::Profiles do
  let(:client) { Courier::Client.new(AUTH_TOKEN_MOCK) }
  let(:profile) { {"name" => "Jane Doe", "email" => "jane@doe.test"} }

  context "get" do
    it "gets profile" do
      stub_request(:get, "https://api.courier.com/profiles/" + RECIPIENT_ID)
        .with(
          headers: TOKEN_AUTH_HEADERS
        ).to_return(body: "{\"profile\":{}}", status: 200)
      res = client.profiles.get(recipient_id: RECIPIENT_ID)
      expect(res).to eq({"profile" => {}})
    end

    it "fails to get profile with exception" do
      stub_request(:get, "https://api.courier.com/profiles/" + RECIPIENT_ID)
        .with(
          headers: TOKEN_AUTH_HEADERS
        ).to_return(body: "{\"message\": \"Not Found\"}", status: 400)
      expect { client.profiles.get(recipient_id: RECIPIENT_ID) }.to raise_error(Courier::CourierAPIError)
    end
  end

  context "get subscriptions" do
    it "gets subs without params" do
      stub_request(:get, "https://api.courier.com/profiles/" + RECIPIENT_ID + "/subscriptions")
        .with(
          headers: TOKEN_AUTH_HEADERS
        ).to_return(body: "{\"paging\": {}, \"results\": []}", status: 200)
      res = client.profiles.get_subscriptions(recipient_id: RECIPIENT_ID)
      expect(res).to eq({"paging" => {}, "results" => []})
    end

    it "gets subs with params" do
      stub_request(:get, "https://api.courier.com/profiles/" + RECIPIENT_ID + "/subscriptions?cursor=1234")
        .with(
          headers: TOKEN_AUTH_HEADERS
        ).to_return(body: "{\"paging\": {}, \"results\": []}", status: 200)
      res = client.profiles.get_subscriptions(recipient_id: RECIPIENT_ID, cursor: "1234")
      expect(res).to eq({"paging" => {}, "results" => []})
    end

    it "fails to get subs with exception" do
      stub_request(:get, "https://api.courier.com/profiles/" + RECIPIENT_ID + "/subscriptions")
        .with(
          headers: TOKEN_AUTH_HEADERS
        ).to_return(body: "{\"message\": \"Not Found\"}", status: 400)
      expect { client.profiles.get_subscriptions(recipient_id: RECIPIENT_ID) }.to raise_error(Courier::CourierAPIError)
    end
  end

  context "replace" do
    it "adds a profile with ADD" do
      stub_request(:put, "https://api.courier.com/profiles/" + RECIPIENT_ID)
        .with(
          body: {"profile": profile},
          headers: TOKEN_AUTH_HEADERS
        ).to_return(status: 204)
      res = client.profiles.add(recipient_id: RECIPIENT_ID, profile: profile)
      expect(res.code.to_i).to eq(204)
    end

    it "adds a profile with REPLACE" do
      stub_request(:put, "https://api.courier.com/profiles/" + RECIPIENT_ID)
        .with(
          body: {"profile" => profile},
          headers: TOKEN_AUTH_HEADERS
        ).to_return(status: 204)
      res = client.profiles.replace(recipient_id: RECIPIENT_ID, profile: profile)
      expect(res.code.to_i).to eq(204)
    end

    it "fails to add with exception" do
      stub_request(:put, "https://api.courier.com/profiles/" + RECIPIENT_ID)
        .with(
          body: {"profile" => profile},
          headers: TOKEN_AUTH_HEADERS
        ).to_return(body: "{\"message\": \"an error occurred\"}", status: 400)
      expect { client.profiles.add(recipient_id: RECIPIENT_ID, profile: profile) }.to raise_error(Courier::CourierAPIError)
    end

    it "fails to replace with exception" do
      stub_request(:put, "https://api.courier.com/profiles/" + RECIPIENT_ID)
        .with(
          body: {"profile" => profile},
          headers: TOKEN_AUTH_HEADERS
        ).to_return(body: "{\"message\": \"an error occurred\"}", status: 400)
      expect { client.profiles.replace(recipient_id: RECIPIENT_ID, profile: profile) }.to raise_error(Courier::CourierAPIError)
    end
  end

  context "merge" do
    it "merges two profiles" do
      stub_request(:post, "https://api.courier.com/profiles/" + RECIPIENT_ID)
        .with(
          headers: TOKEN_AUTH_HEADERS,
          body: {"profile" => profile}
        ).to_return(body: "{\"status\": \"SUCCESS\"}", status: 200)
      res = client.profiles.merge(recipient_id: RECIPIENT_ID, profile: profile)
      expect(res).to eq({"status" => "SUCCESS"})
    end

    it "merges with idempotency" do
      idemp_headers = TOKEN_AUTH_HEADERS.merge({"idempotency_key": "idempotency_mock"})
      stub_request(:post, "https://api.courier.com/profiles/" + RECIPIENT_ID)
        .with(
          headers: idemp_headers,
          body: {"profile" => profile}
        ).to_return(body: "{\"status\": \"SUCCESS\"}", status: 200)
      res = client.profiles.merge(recipient_id: RECIPIENT_ID, profile: profile, idempotency_key: "idempotency_mock")
      expect(res).to eq({"status" => "SUCCESS"})
    end

    it "fails with exception" do
      stub_request(:post, "https://api.courier.com/profiles/" + RECIPIENT_ID)
        .with(
          body: {"profile" => profile},
          headers: TOKEN_AUTH_HEADERS
        ).to_return(body: "{\"message\": \"an error occurred\"}", status: 400)
      expect { client.profiles.merge(recipient_id: RECIPIENT_ID, profile: profile) }.to raise_error(Courier::CourierAPIError)
    end
  end

  context "patch" do
    it "patches operations" do
      operations = [
        {
          "op" => "add",
          "path" => "/number",
          "value" => 4
        },
        {
          "op" => "replace",
          "path" => "/number",
          "value" => 5
        },
        {
          "op" => "copy",
          "from" => "/number",
          "path" => "/test_num"
        }
      ]
      stub_request(:patch, "https://api.courier.com/profiles/" + RECIPIENT_ID)
        .with(
          headers: TOKEN_AUTH_HEADERS,
          body: {"patch" => operations}
        ).to_return(body: "{\"status\": \"SUCCESS\"}", status: 200)
      res = client.profiles.patch(recipient_id: RECIPIENT_ID, operations: operations)
      expect(res).to eq({"status" => "SUCCESS"})
    end

    it "fails to patch with exception" do
      operations = [
        {
          "op" => "add",
          "path" => "/number",
          "value" => 4
        }
      ]
      stub_request(:patch, "https://api.courier.com/profiles/" + RECIPIENT_ID)
        .with(
          body: {"patch" => operations},
          headers: TOKEN_AUTH_HEADERS
        ).to_return(body: "{\"message\": \"an error occurred\"}", status: 400)
      expect { client.profiles.patch(recipient_id: RECIPIENT_ID, operations: operations) }.to raise_error(Courier::CourierAPIError)
    end
  end
end
