EventId = ENV["COURIER_NOTIFICATION_ID"]
AuthToken = ENV["COURIER_AUTH_TOKEN"]

RSpec.describe Courier do
  it "has a version number" do
    expect(Courier::VERSION).not_to be nil
  end

  it "catches no 'event'" do
    client = Courier::Client.new AuthToken
    expect { client.send({
      "recipient" => "@rubysdk",
      "data" => {
        "world" => "Ruby!"
      }
    }) }.to raise_error(Courier::InputError)
  end

  it "catches response error" do
    client = Courier::Client.new "INVALID_AUTH_TOKEN"
    expect { client.send({
      "event" => EventId,
      "recipient" => "@rubysdk",
      "data" => {
        "world" => "Ruby!"
      }
    }) }.to raise_error(Courier::ResponseError)
  end

  it "sends" do
    client = Courier::Client.new AuthToken
    res = client.send({
      "event" => EventId,
      "recipient" => "@rubysdk",
      "data" => {
        "world" => "Ruby!"
      }
    })
    expect(res.code).to eq(200)
  end
end
