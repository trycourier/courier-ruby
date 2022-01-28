require_relative "spec_helper"

RSpec.describe Courier::Automations do
  let(:client) { Courier::Client.new(AUTH_TOKEN_MOCK) }

  context "invoke" do
    it "invokes ad-hoc automation" do
      steps = [
        {
          "action" => "send"
        }
      ]
      automation = {
        "steps" => steps
      }

      stub_request(:post, "https://api.courier.com/automations/invoke")
        .with(
          body: {"automation" => automation},
          headers: TOKEN_AUTH_HEADERS
        )
        .to_return(body: "{\"runId\": \"1234\"}", status: 200)

      res = client.automations.invoke(automation: automation)

      expect(res).to eq({"runId" => "1234"})
    end

    it "fails to invoke ad-hoc automation" do
      stub_request(:post, "https://api.courier.com/automations/invoke")
        .with(
          headers: TOKEN_AUTH_HEADERS
        )
        .to_return(body: "{\"message\": \"Either an ad hoc automation or valid templateId is required.\"}", status: 400)

      expect { client.automations.invoke(automation: nil) }.to raise_error(Courier::CourierAPIError)
    end
  end

  context "invoke template" do
    it "invokes automation template" do
      stub_request(:post, "https://api.courier.com/automations/" + AUTOMATION_TEMPLATE_ID + "/invoke")
        .with(
          headers: TOKEN_AUTH_HEADERS
        )
        .to_return(body: "{\"runId\": \"1234\"}", status: 200)

      res = client.automations.invoke_template(template_id: AUTOMATION_TEMPLATE_ID)

      expect(res).to eq({"runId" => "1234"})
    end

    it "fails to invoke automation template" do
      stub_request(:post, "https://api.courier.com/automations/" + AUTOMATION_TEMPLATE_ID + "/invoke")
        .with(
          headers: TOKEN_AUTH_HEADERS
        )
        .to_return(body: "{\"message\": \"Internal Server Error\"}", status: 500)

      expect { client.automations.invoke_template(template_id: AUTOMATION_TEMPLATE_ID) }.to raise_error(Courier::CourierAPIError)
    end
  end
end
