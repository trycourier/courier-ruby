require_relative "spec_helper"

RSpec.describe Courier do
  it "has a version number" do
    expect(Courier::VERSION).not_to be nil
  end

  context "BaseURL" do
    it "sets url from param" do
      ENV["COURIER_BASE_URL"] = nil
      client = Courier::Client.new(AUTH_TOKEN_MOCK, base_url: "https://someurl.com")
      expect(client.session.base_url).to eq("https://someurl.com")
    end

    it "sets base url from env" do
      ENV["COURIER_BASE_URL"] = "https://someurl.com"
      client = Courier::Client.new(AUTH_TOKEN_MOCK)
      expect(client.session.base_url).to eq("https://someurl.com")
    end

    it "sets base url to default" do
      ENV["COURIER_BASE_URL"] = nil
      client = Courier::Client.new(AUTH_TOKEN_MOCK)
      expect(client.session.base_url).to eq(DEFAULT_COURIER_URL)
    end
  end

  context "Authentication" do
    it "is not authenticated without basic or token auth" do
      ENV["COURIER_AUTH_TOKEN"] = nil
      ENV["COURIER_AUTH_USERNAME"] = nil
      client = Courier::Client.new
      expect(client.session.isAuthenticated).to eq(false)
    end

    it "initializes token auth from param" do
      client = Courier::Client.new(AUTH_TOKEN_MOCK)
      expect(client.session.isAuthenticated).to eq(true)
    end

    it "initializes token auth from env" do
      ENV["COURIER_AUTH_TOKEN"] = AUTH_TOKEN_MOCK
      client = Courier::Client.new
      expect(client.session.isAuthenticated).to eq(true)
    end

    it "initializes basic auth from params" do
      ENV["COURIER_AUTH_TOKEN"] = nil
      ENV["CORUER_AUTH_USERNAME"] = nil
      client = Courier::Client.new(username: "jane", password: "doe")
      expect(client.session.isAuthenticated).to eq(true)
    end

    it "initializes basic auth from env" do
      ENV["COURIER_AUTH_TOKEN"] = nil
      ENV["COURIER_AUTH_USERNAME"] = "jane"
      ENV["COURIER_AUTH_PASSWORD"] = "doe"
      client = Courier::Client.new
      expect(client.session.isAuthenticated).to eq(true)
    end
  end

  context "Send" do
    it "catches no 'event' with input as strings" do
      client = Courier::Client.new(AUTH_TOKEN_MOCK)
      expect { client.send({
        "recipient" => "@rubysdk",
        "data" => {
          "world" => "Ruby!"
        }
      }) }.to raise_error(Courier::InputError)
    end

    it "catches no 'event' with input as keys" do
      client = Courier::Client.new(AUTH_TOKEN_MOCK)
      expect { client.send({
        :recipient => "@rubysdk",
        :data => {
          :world => "Ruby!"
        }
      }) }.to raise_error(Courier::InputError)
    end

    it "catches no 'recipient' with input as strings" do
      client = Courier::Client.new(AUTH_TOKEN_MOCK)
      expect { client.send({
        "event" => EVENT_ID,
        "data" => {
          "world" => "Ruby!"
        }
      }) }.to raise_error(Courier::InputError)
    end

    it "catches no 'recipient' with input as keys" do
      client = Courier::Client.new(AUTH_TOKEN_MOCK)
      expect { client.send({
        :event => EVENT_ID,
        :data => {
          :world => "Ruby!"
        }
      }) }.to raise_error(Courier::InputError)
    end


    it "sends with token auth with input as strings" do
      stub_request(:post, "https://api.courier.com/send")
        .with(
          body: {"event" => NOTIFICATION_ID, "recipient" => RECIPIENT_ID, "data" => {"world" => "Ruby!"}},
          headers: {
            "Authorization" => "Bearer " + AUTH_TOKEN_MOCK,
            "Content-Type" => "application/json",
            "Host" => "api.courier.com",
            "User-Agent" => "courier-ruby/#{Courier::VERSION}"
          }
        )
        .to_return(body: "{\"messageId\": \"1-5e2b2615-05efbb3acab9172f88dd3f6f\"}", status: 200)

      client = Courier::Client.new(AUTH_TOKEN_MOCK)
      res = client.send({
        "event"=> NOTIFICATION_ID,
        "recipient" => RECIPIENT_ID,
        "data" => {
          "world" => "Ruby!"
        }
      })
      expect(res.code).to eq(200)
      expect(res.message_id).to eq("1-5e2b2615-05efbb3acab9172f88dd3f6f")
    end

    it "sends with token auth with input as keys" do
      stub_request(:post, "https://api.courier.com/send")
        .with(
          body: {"event" => NOTIFICATION_ID, "recipient" => RECIPIENT_ID, "data" => {"world" => "Ruby!"}},
          headers: {
            "Authorization" => "Bearer " + AUTH_TOKEN_MOCK,
            "Content-Type" => "application/json",
            "Host" => "api.courier.com",
            "User-Agent" => "courier-ruby/#{Courier::VERSION}"
          }
        )
        .to_return(body: "{\"messageId\": \"1-5e2b2615-05efbb3acab9172f88dd3f6f\"}", status: 200)

      client = Courier::Client.new(AUTH_TOKEN_MOCK)
      res = client.send({
        :event => NOTIFICATION_ID,
        :recipient => RECIPIENT_ID,
        :data => {
          :world => "Ruby!"
        }
      })
      expect(res.code).to eq(200)
      expect(res.message_id).to eq("1-5e2b2615-05efbb3acab9172f88dd3f6f")
    end

    it "sends with basic auth" do
      stub_request(:post, "https://api.courier.com/send")
        .with(
          body: {"event" => NOTIFICATION_ID, "recipient" => RECIPIENT_ID, "data" => {"world" => "Ruby!"}},
          headers: {
            "Authorization" => "Basic " + Base64.strict_encode64(AUTH_USERNAME_MOCK + ":" + AUTH_PASSWORD_MOCK),
            "Content-Type" => "application/json",
            "Host" => "api.courier.com",
            "User-Agent" => "courier-ruby/#{Courier::VERSION}"
          }
        )
        .to_return(body: "{\"messageId\": \"1-5e2b2615-05efbb3acab9172f88dd3f6f\"}", status: 200)

      ENV["COURIER_AUTH_TOKEN"] = nil
      client = Courier::Client.new(username: AUTH_USERNAME_MOCK, password: AUTH_PASSWORD_MOCK)
      res = client.send({
        "event" => NOTIFICATION_ID,
        "recipient" => RECIPIENT_ID,
        "data" => {
          "world" => "Ruby!"
        }
      })
      expect(res.code).to eq(200)
      expect(res.message_id).to eq("1-5e2b2615-05efbb3acab9172f88dd3f6f")
    end
  end
end
