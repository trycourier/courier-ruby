require_relative "spec_helper"

RSpec.describe Courier::AuditEvents do
  let(:client) { Courier::Client.new(AUTH_TOKEN_MOCK) }

  context "get audit event" do
    it "get audit event" do
      stub_request(:get, "https://api.courier.com/audit-events/dmC5ao2JWuy05cfCXhfCo")
        .with(
          body: {},
          headers: TOKEN_AUTH_HEADERS
        )
        .to_return(body: "{ \"actor\": { \"email\": \"foo@bar.com\", \"id\": \"foo-user\" }, \"auditEventId\": \"dmC5ao2JWuy05cfCXhfCo\", \"source\": \"courier.studio\", \"target\": {}, \"timestamp\": \"2022-07-22T22:33:59.552Z\", \"type\": \"notification:published\", \"workspaceId\": \"my-workspace\" }", status: 200)

      res = client.audit_events.get(audit_event_id: "dmC5ao2JWuy05cfCXhfCo")

      expect(res).to eq({
        "actor" => {
          "email" => "foo@bar.com",
          "id" => "foo-user"
        },
        "auditEventId" => "dmC5ao2JWuy05cfCXhfCo",
        "source" => "courier.studio",
        "target" => {},
        "timestamp" => "2022-07-22T22:33:59.552Z",
        "type" => "notification:published",
        "workspaceId" => "my-workspace"
      })
    end
  end

  context "list audit events" do
    it "list audit events" do
      stub_request(:get, "https://api.courier.com/audit-events")
        .with(
          body: {},
          headers: TOKEN_AUTH_HEADERS
        )
        .to_return(body: "{ \"results\": [ { \"actor\": { \"email\": \"foo@bar.com\", \"id\": \"foo-user\" }, \"auditEventId\": \"dmC5ao2JWuy05cfCXhfCo\", \"source\": \"courier.studio\", \"target\": {}, \"timestamp\": \"2022-07-22T22:33:59.552Z\", \"type\": \"notification:published\", \"workspaceId\": \"my-workspace\" } ], \"paging\": { \"cursor\": null, \"more\": false } }", status: 200)

      res = client.audit_events.list()

      expect(res).to eq({"results" => [{
        "actor" => {
          "email" => "foo@bar.com",
          "id" => "foo-user"
        },
        "auditEventId" => "dmC5ao2JWuy05cfCXhfCo",
        "source" => "courier.studio",
        "target" => {},
        "timestamp" => "2022-07-22T22:33:59.552Z",
        "type" => "notification:published",
        "workspaceId" => "my-workspace"
      }], "paging" => {"cursor" => nil, "more" => false}})
    end
  end
end
