require_relative "spec_helper"

RSpec.describe Courier::Lists do
  let(:client) { Courier::Client.new(auth_token: AUTH_TOKEN_MOCK) }

  context "send" do
    it "sends to list" do
      stub_request(:post, "https://api.courier.com/send/list")
        .with(
          body: {"event" => NOTIFICATION_ID, "list" => LIST_ID, "data" => {}},
          headers: TOKEN_AUTH_HEADERS
        )
        .to_return(body: "{\"status\": \"ok\"}", status: 200)
      res = client.lists.send(NOTIFICATION_ID, list: LIST_ID)
      expect(res).to eq({"status" => "ok"})
    end

    it "sends to list pattern" do
      stub_request(:post, "https://api.courier.com/send/list")
        .with(
          body: {"event" => NOTIFICATION_ID, "pattern" => "my_list.*", "data" => {}},
          headers: TOKEN_AUTH_HEADERS
        )
        .to_return(body: "{\"status\": \"ok\"}", status: 200)
      res = client.lists.send(NOTIFICATION_ID, pattern: "my_list.*")
      expect(res).to eq({"status" => "ok"})
    end

    it "sends with options" do
      stub_request(:post, "https://api.courier.com/send/list")
        .with(
          body: {"event" => NOTIFICATION_ID, "list" => LIST_ID, "data" => {}, "brand" => BRAND_ID, "override" => {'provider': {}}},
          headers: TOKEN_AUTH_HEADERS
        )
        .to_return(body: "{\"status\": \"ok\"}", status: 200)
      res = client.lists.send(NOTIFICATION_ID, list: LIST_ID, brand: BRAND_ID, override: {"provider": {}})
      expect(res).to eq({"status" => "ok"})
      # ALSO NEED TO TEST OVERRIDE OBJECT!
    end

    it "sends with idempotency" do
      idemp_headers = TOKEN_AUTH_HEADERS.merge({"idempotency_key": "idempotency_mock"})
      stub_request(:post, "https://api.courier.com/send/list")
        .with(
          body: {"event" => NOTIFICATION_ID, "list" => LIST_ID, "data" => {}},
          headers: idemp_headers
        )
        .to_return(body: "{\"status\": \"ok\"}", status: 200)
      res = client.lists.send(NOTIFICATION_ID, list: LIST_ID, idempotency_key: "idempotency_mock")
      expect(res).to eq({"status" => "ok"})
      # ALSO NEED TO TEST IDEMPOTENCY KEY!
    end

    it "fails to send to list" do
      stub_request(:post, "https://api.courier.com/send/list")
        .with(
          body: {"event" => NOTIFICATION_ID, "list" => LIST_ID, "data" => {}},
          headers: TOKEN_AUTH_HEADERS
        ).to_return(body: "{\"message\": \"an error occurred\"}", status: 400)
      expect { client.lists.send(NOTIFICATION_ID, list: LIST_ID) }.to raise_error(Courier::CourierAPIError)
    end
  end

  context "list" do
    it "gets list without params" do
      stub_request(:get, "https://api.courier.com/lists")
        .with(
          headers: TOKEN_AUTH_HEADERS
        ).to_return(body: "{\"paging\": {}, \"items\": []}", status: 200)
      res = client.lists.list
      expect(res).to eq({"paging" => {}, "items" => []})
    end

    it "gets list with params" do
      stub_request(:get, "https://api.courier.com/lists?cursor=1234&pattern=my.list.*")
        .with(
          headers: TOKEN_AUTH_HEADERS
        ).to_return(body: "{\"paging\": {}, \"items\": []}", status: 200)
      res = client.lists.list(cursor: "1234", pattern: "my.list.*")
      expect(res).to eq({"paging" => {}, "items" => []})
    end

    it "fails with exception" do
      stub_request(:get, "https://api.courier.com/lists")
        .with(
          headers: TOKEN_AUTH_HEADERS
        ).to_return(body: "{\"message\": \"an error occurred\"}", status: 400)
      expect { client.lists.list }.to raise_error(Courier::CourierAPIError)
    end
  end

  context "get" do
    it "gets list" do
      stub_request(:get, "https://api.courier.com/lists/" + LIST_ID)
        .with(
          headers: TOKEN_AUTH_HEADERS
        ).to_return(body: "{\"id\": \"my.list.id\", \"name\": \"My List\"}", status: 200)
      res = client.lists.get(LIST_ID)
      expect(res).to eq({"id" => "my.list.id", "name" => "My List"})
    end

    it "fails with exception" do
      stub_request(:get, "https://api.courier.com/lists/" + LIST_ID)
        .with(
          headers: TOKEN_AUTH_HEADERS
        ).to_return(body: "{\"message\": \"an error occurred\"}", status: 400)
      expect { client.lists.get(LIST_ID) }.to raise_error(Courier::CourierAPIError)
    end
  end

  context "put" do
    it "adds a list" do
      stub_request(:put, "https://api.courier.com/lists/" + LIST_ID)
        .with(
          body: {"name" => "My List"},
          headers: TOKEN_AUTH_HEADERS
        ).to_return(status: 204)
      res = client.lists.put(LIST_ID, "My List")
      expect(res.code.to_i).to eq(204)
    end

    it "fails with exception" do
      stub_request(:put, "https://api.courier.com/lists/" + LIST_ID)
        .with(
          body: {"name" => "My List"},
          headers: TOKEN_AUTH_HEADERS
        ).to_return(body: "{\"message\": \"an error occurred\"}", status: 400)
      expect { client.lists.put(LIST_ID, "My List") }.to raise_error(Courier::CourierAPIError)
    end
  end

  context "delete" do
    it "deletes a list" do
      stub_request(:delete, "https://api.courier.com/lists/" + LIST_ID)
        .with(
          headers: TOKEN_AUTH_HEADERS
        ).to_return(status: 204)
      res = client.lists.delete(LIST_ID)
      expect(res.code.to_i).to eq(204)
    end

    it "fails with exception" do
      stub_request(:delete, "https://api.courier.com/lists/" + LIST_ID)
        .with(
          headers: TOKEN_AUTH_HEADERS
        ).to_return(body: "{\"message\": \"an error occurred\"}", status: 400)
      expect { client.lists.delete(LIST_ID) }.to raise_error(Courier::CourierAPIError)
    end
  end

  context "restore" do
    it "restores a list" do
      stub_request(:put, "https://api.courier.com/lists/" + LIST_ID + "/restore")
        .with(
          headers: TOKEN_AUTH_HEADERS
        ).to_return(status: 204)
      res = client.lists.restore(LIST_ID)
      expect(res.code.to_i).to eq(204)
    end

    it "fails with exception" do
      stub_request(:put, "https://api.courier.com/lists/" + LIST_ID + "/restore")
        .with(
          headers: TOKEN_AUTH_HEADERS
        ).to_return(body: "{\"message\": \"an error occurred\"}", status: 400)
      expect { client.lists.restore(LIST_ID) }.to raise_error(Courier::CourierAPIError)
    end
  end

  context "get subscriptions" do
    it "gets without params" do
      stub_request(:get, "https://api.courier.com/lists/" + LIST_ID + "/subscriptions")
        .with(
          headers: TOKEN_AUTH_HEADERS
        ).to_return(body: "{\"paging\": {}, \"items\": []}", status: 200)
      res = client.lists.get_subscriptions(LIST_ID)
      expect(res).to eq({"paging" => {}, "items" => []})
    end

    it "gets with params" do
      stub_request(:get, "https://api.courier.com/lists/" + LIST_ID + "/subscriptions?cursor=1234")
        .with(
          headers: TOKEN_AUTH_HEADERS
        ).to_return(body: "{\"paging\": {}, \"items\": []}", status: 200)
      res = client.lists.get_subscriptions(LIST_ID, cursor: "1234")
      expect(res).to eq({"paging" => {}, "items" => []})
    end

    it "fails with exception" do
      stub_request(:get, "https://api.courier.com/lists/" + LIST_ID + "/subscriptions")
        .with(
          headers: TOKEN_AUTH_HEADERS
        ).to_return(body: "{\"message\": \"Not Found\"}", status: 400)
      expect { client.lists.get_subscriptions(LIST_ID) }.to raise_error(Courier::CourierAPIError)
    end
  end

  context "subscribe" do
    it "adds multiple subscribers" do
      stub_request(:put, "https://api.courier.com/lists/" + LIST_ID + "/subscriptions")
        .with(
          headers: TOKEN_AUTH_HEADERS
        ).to_return(status: 204)
      res = client.lists.put_subscriptions(LIST_ID, ["1234", "5678"])
      expect(res.code.to_i).to eq(204)
    end

    it "fails with exception for multiple subscribers" do
      stub_request(:put, "https://api.courier.com/lists/" + LIST_ID + "/subscriptions")
        .with(
          headers: TOKEN_AUTH_HEADERS
        ).to_return(body: "{\"message\": \"Error Message\"}", status: 400)
      expect { client.lists.put_subscriptions(LIST_ID, ["1234", "5678"]) }.to raise_error(Courier::CourierAPIError)
    end

    it "adds a single subscriber" do
      stub_request(:put, "https://api.courier.com/lists/" + LIST_ID + "/subscriptions/" + RECIPIENT_ID)
        .with(
          headers: TOKEN_AUTH_HEADERS
        ).to_return(status: 204)
      res = client.lists.subscribe(LIST_ID, RECIPIENT_ID)
      expect(res.code.to_i).to eq(204)
    end

    it "fails with exception for single subscriber" do
      stub_request(:put, "https://api.courier.com/lists/" + LIST_ID + "/subscriptions/" + RECIPIENT_ID)
        .with(
          headers: TOKEN_AUTH_HEADERS
        ).to_return(body: "{\"message\": \"Error Message\"}", status: 400)
      expect { client.lists.subscribe(LIST_ID, RECIPIENT_ID) }.to raise_error(Courier::CourierAPIError)
    end
  end

  context "unsubscribe" do
    it "unsubscribes a recipient" do
      stub_request(:delete, "https://api.courier.com/lists/" + LIST_ID + "/subscriptions/" + RECIPIENT_ID)
        .with(
          headers: TOKEN_AUTH_HEADERS
        ).to_return(status: 204)
      res = client.lists.unsubscribe(LIST_ID, RECIPIENT_ID)
      expect(res.code.to_i).to eq(204)
    end

    it "fails with exception for single unsubscriber" do
      stub_request(:delete, "https://api.courier.com/lists/" + LIST_ID + "/subscriptions/" + RECIPIENT_ID)
        .with(
          headers: TOKEN_AUTH_HEADERS
        ).to_return(body: "{\"message\": \"Error Message\"}", status: 400)
      expect { client.lists.unsubscribe(LIST_ID, RECIPIENT_ID) }.to raise_error(Courier::CourierAPIError)
    end
  end
end
