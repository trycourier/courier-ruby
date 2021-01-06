require_relative "spec_helper"

RSpec.describe Courier::Events do
  let(:client) {Courier::Client.new(auth_token:AUTH_TOKEN_MOCK)}

  context "list" do
    it "lists events without parameters" do
      stub_request(:get, "https://api.courier.com/events")
        .with(
          headers: TOKEN_AUTH_HEADERS
        )
        .to_return(body: "{\"results\": []}", status: 200)
      res = client.events.list
      expect(res).to eq({"results" => []})
    end

    it "fails to list events with exception" do
      stub_request(:get, "https://api.courier.com/events")
        .with(
          headers: TOKEN_AUTH_HEADERS
        ).to_return(body: "{\"message\": \"an error occurred\"}", status: 400)
      expect {client.events.list}.to raise_error(Courier::CourierAPIException)
    end
  end

  context "get" do
    it "gets event" do
      stub_request(:get, "https://api.courier.com/events/" + EVENT_ID)
        .with(
          headers: TOKEN_AUTH_HEADERS
        ).to_return(body: "{\"id\": \"notification.id\", \"type\": \"notification\"}", status: 200)
      res = client.events.get(EVENT_ID)
      expect(res).to eq({"id" => "notification.id", "type" => "notification"})
    end

    it "fails to get event with exception" do
      stub_request(:get, "https://api.courier.com/events/" + EVENT_ID)
        .with(
          headers: TOKEN_AUTH_HEADERS
        ).to_return(body: "{\"message\": \"Not Found\"}", status: 400)
      expect{client.events.get(EVENT_ID)}.to raise_error(Courier::CourierAPIException)
    end
  end

  context "replace" do
    it "adds an event with ADD without params" do
      payload = {"id" => NOTIFICATION_ID, "type" => "notification"}
      stub_request(:put, "https://api.courier.com/events/" + EVENT_ID)
        .with(
          body: payload,
          headers: TOKEN_AUTH_HEADERS
        ).to_return(status: 204)
      res = client.events.add(EVENT_ID, NOTIFICATION_ID, type:"notification")
      expect(res.code.to_i).to eq(204)
    end

    it "adds an event with REPLACE without params" do
      payload = {"id" => NOTIFICATION_ID, "type" => "notification"}
      stub_request(:put, "https://api.courier.com/events/" + EVENT_ID)
        .with(
          body: payload,
          headers: TOKEN_AUTH_HEADERS
        ).to_return(status: 204)
      res = client.events.replace(EVENT_ID, NOTIFICATION_ID)
      expect(res.code.to_i).to eq(204)
    end
    
    it "adds an event with ADD with params" do
      payload = {"id" => NOTIFICATION_ID, "type" => "event_type"}
      stub_request(:put, "https://api.courier.com/events/" + EVENT_ID)
        .with(
          body: payload,
          headers: TOKEN_AUTH_HEADERS
        ).to_return(status: 204)
      res = client.events.add(EVENT_ID, NOTIFICATION_ID, type:"event_type")
      expect(res.code.to_i).to eq(204)
    end

    it "adds an event with REPLACE with params" do
      payload = {"id" => NOTIFICATION_ID, "type" => "event_type"}
      stub_request(:put, "https://api.courier.com/events/" + EVENT_ID)
        .with(
          body: payload,
          headers: TOKEN_AUTH_HEADERS
        ).to_return(status: 204)
      res = client.events.replace(EVENT_ID, NOTIFICATION_ID, type: "event_type")
      expect(res.code.to_i).to eq(204)
    end

    it "fails to add with exception" do
      payload = {"id" => NOTIFICATION_ID, "type" => "notification"}
      stub_request(:put, "https://api.courier.com/events/" + EVENT_ID)
        .with(
          body: payload,
          headers: TOKEN_AUTH_HEADERS
        ).to_return(body: "{\"message\": \"an error occurred\"}", status: 400)
      expect{client.events.add(EVENT_ID, NOTIFICATION_ID)}.to raise_error(Courier::CourierAPIException)
    end

    it "fails to replace with exception" do
      payload = {"id" => NOTIFICATION_ID, "type" => "notification"}
      stub_request(:put, "https://api.courier.com/events/" + EVENT_ID)
        .with(
          body: payload,
          headers: TOKEN_AUTH_HEADERS
        ).to_return(body: "{\"message\": \"an error occurred\"}", status: 400)
      expect{client.events.replace(EVENT_ID, NOTIFICATION_ID)}.to raise_error(Courier::CourierAPIException)
    end
  end
end