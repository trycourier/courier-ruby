require_relative "spec_helper"

RSpec.describe Courier::Messages do
  let(:client) { Courier::Client.new(AUTH_TOKEN_MOCK) }

  context "list" do
    it "succeeds without parameters" do
      stub_request(:get, "https://api.courier.com/messages")
        .with(
          headers: TOKEN_AUTH_HEADERS
        )
        .to_return(body: "{\"paging\": {}, \"items\": []}", status: 200)
      res = client.messages.list
      expect(res).to eq({"paging" => {}, "items" => []})
    end

    it "succeeds with parameters" do
      stub_request(:get, "https://api.courier.com/messages?cursor=12&event=34&recipient=56&notification=78&messageId=91&list=23")
        .with(
          headers: TOKEN_AUTH_HEADERS
        )
        .to_return(body: "{\"paging\": {}, \"items\": []}", status: 200)
      res = client.messages.list(cursor: "12", event: "34", recipient: "56",
                                 notification: "78", message_id: "91", list_id: "23")
      expect(res).to eq({"paging" => {}, "items" => []})
    end

    it "fails with exception" do
      stub_request(:get, "https://api.courier.com/messages")
        .with(
          headers: TOKEN_AUTH_HEADERS
        ).to_return(body: "{\"message\": \"an error occurred\"}", status: 400)
      expect { client.messages.list }.to raise_error(Courier::CourierAPIError)
    end
  end

  context "get" do
    it "gets message" do
      stub_request(:get, "https://api.courier.com/messages/" + MESSAGE_ID)
        .with(
          headers: TOKEN_AUTH_HEADERS
        ).to_return(body: "{\"id\": \"my.message.id\", \"name\": \"My Message\"}", status: 200)
      res = client.messages.get(message_id: MESSAGE_ID)
      expect(res).to eq({"id" => "my.message.id", "name" => "My Message"})
    end

    it "fails with exception" do
      stub_request(:get, "https://api.courier.com/messages/" + MESSAGE_ID)
        .with(
          headers: TOKEN_AUTH_HEADERS
        ).to_return(body: "{\"message\": \"an error occurred\"}", status: 400)
      expect { client.messages.get(message_id: MESSAGE_ID) }.to raise_error(Courier::CourierAPIError)
    end
  end

  context "cancel" do
    it "cancels message" do
      stub_request(:post, "https://api.courier.com/messages/" + MESSAGE_ID + "/cancel")
        .with(
          headers: TOKEN_AUTH_HEADERS
        ).to_return(body: "{\"id\": \"my.message.id\", \"name\": \"My Message\"}", status: 200)
      res = client.messages.cancel(message_id: MESSAGE_ID)
      expect(res).to eq({"id" => "my.message.id", "name" => "My Message"})
    end

    it "fails with exception" do
      stub_request(:post, "https://api.courier.com/messages/" + MESSAGE_ID + "/cancel")
        .with(
          headers: TOKEN_AUTH_HEADERS
        ).to_return(body: "{\"message\": \"an error occurred\"}", status: 409)
      expect { client.messages.cancel(message_id: MESSAGE_ID) }.to raise_error(Courier::CourierAPIError)
    end
  end

  context "get history" do
    it "gets without parameters" do
      stub_request(:get, "https://api.courier.com/messages/" + MESSAGE_ID + "/history")
        .with(
          headers: TOKEN_AUTH_HEADERS
        ).to_return(body: "{\"results\": []}", status: 200)
      res = client.messages.get_history(message_id: MESSAGE_ID)
      expect(res).to eq({"results" => []})
    end

    it "gets with parameters" do
      stub_request(:get, "https://api.courier.com/messages/" + MESSAGE_ID + "/history?type=test_type")
        .with(
          headers: TOKEN_AUTH_HEADERS
        ).to_return(body: "{\"results\": []}", status: 200)
      res = client.messages.get_history(message_id: MESSAGE_ID, type: "test_type")
      expect(res).to eq({"results" => []})
    end

    it "fails with exception" do
      stub_request(:get, "https://api.courier.com/messages/" + MESSAGE_ID + "/history")
        .with(
          headers: TOKEN_AUTH_HEADERS
        ).to_return(body: "{\"message\": \"an error occurred\"}", status: 400)
      expect { client.messages.get_history(message_id: MESSAGE_ID) }.to raise_error(Courier::CourierAPIError)
    end
  end
end
