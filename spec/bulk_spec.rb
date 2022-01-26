require_relative "spec_helper"

RSpec.describe Courier::Bulk do
  let(:client) { Courier::Client.new(AUTH_TOKEN_MOCK) }

  context "create job" do
    it "creates a bulk job" do
      message = {
        "event" => "foo"
      }

      stub_request(:post, "https://api.courier.com/bulk")
        .with(
          body: {"message" => message},
          headers: TOKEN_AUTH_HEADERS
        )
        .to_return(body: "{\"jobId\": \"1234\"}", status: 201)

        res = client.bulk.create_job(message: message)

      expect(res).to eq({"jobId" => "1234"})
    end
  end

  context "ingest job" do
    it "ingest users into a bulk job" do
      users = [
        {
          "recipient" => "johndoe"
        }
      ]

      stub_request(:post, "https://api.courier.com/bulk/1234")
        .with(
          body: {"users" => users},
          headers: TOKEN_AUTH_HEADERS
        )
        .to_return(body: "{\"errors\": [], \"total\": 1}", status: 200)

        res = client.bulk.ingest_job(job_id: "1234", users: users)

        expect(res).to eq({"errors" => [], "total" => 1})
    end
  end

  context "run job" do
    it "run a bulk job" do
      stub_request(:post, "https://api.courier.com/bulk/1234/run")
        .with(
          body: {},
          headers: TOKEN_AUTH_HEADERS
        )
        .to_return(body: "", status: 202)

        res = client.bulk.run_job(job_id: "1234")
    end
  end

  context "get job" do
    it "get bulk job" do
      stub_request(:get, "https://api.courier.com/bulk/1234")
        .with(
          body: {},
          headers: TOKEN_AUTH_HEADERS
        )
        .to_return(body: "{ \"job\": { \"definition\": { \"event\": \"foo\" }, \"enqueued\": 1, \"failures\": 0, \"received\": 1, \"status\": \"COMPLETED\" }}", status: 200)

        res = client.bulk.get_job(job_id: "1234")

        expect(res).to eq({"job" => {"definition" => { "event" => "foo"}, "enqueued" => 1, "failures" => 0, "received" => 1, "status" => "COMPLETED"}})
    end
  end

  context "get job users" do
    it "get bulk job users" do
      stub_request(:get, "https://api.courier.com/bulk/1234/users")
        .with(
          body: {},
          headers: TOKEN_AUTH_HEADERS
        )
        .to_return(body: "{ \"items\": [ { \"recipient\": \"johndoe\" } ], \"paging\": { \"cursor\": null, \"more\": false } }", status: 200)

        res = client.bulk.get_job_users(job_id: "1234")

        expect(res).to eq({"items" => [{ "recipient" => "johndoe" }], "paging" => { "cursor" => nil, "more" => false}})
    end
  end
end
