require_relative "spec_helper"

RSpec.describe Courier::Audiences do
  let(:client) { Courier::Client.new(AUTH_TOKEN_MOCK) }

  context "(create | update) audience" do
    it "should create or update existing audience" do
      filter = {
        "operator" => "AND",
        "value" => "Software Engineer",
        "path" => "title"
      }

      stub_request(:put, "https://api.courier.com/audiences/software-engineers-from-sf")
        .with(
          body: {"filter" => filter},
          headers: TOKEN_AUTH_HEADERS
        )
        .to_return(body: '{"audience":{"id":"software-engineers-from-sf","name":"","description":"","created_at":"2022-03-24T18:56:49.181Z","updated_at":"2022-03-24T19:54:37.982Z","filter":{"path":"title","value":"Software Engineer","operator":"EQ"}}}', status: 200)

      res = client.audiences.put(audience_id: "software-engineers-from-sf", payload: {"filter" => filter})

      expect(res).to eq({"audience" => {"id" => "software-engineers-from-sf", "name" => "", "description" => "", "created_at" => "2022-03-24T18:56:49.181Z", "updated_at" => "2022-03-24T19:54:37.982Z", "filter" => {"path" => "title", "value" => "Software Engineer", "operator" => "EQ"}}})
    end
  end

  context "get audience" do
    it "should get audience by id" do
      stub_request(:get, "https://api.courier.com/audiences/software-engineers-from-sf")
        .with(
          body: {},
          headers: TOKEN_AUTH_HEADERS
        )
        .to_return(body: '{"id":"software-engineers-from-sf","name":"","description":"","created_at":"2022-03-24T18:56:49.181Z","updated_at":"2022-03-24T19:54:37.982Z","filter":{"path":"title","value":"Software Engineer","operator":"EQ"}}', status: 200)

      res = client.audiences.get_audience(audience_id: "software-engineers-from-sf")

      expect(res).to eq({
        "created_at" => "2022-03-24T18:56:49.181Z",
        "description" => "",
        "filter" => {"path" => "title", "value" => "Software Engineer", "operator" => "EQ"},
        "id" => "software-engineers-from-sf",
        "name" => "",
        "updated_at" => "2022-03-24T19:54:37.982Z"
      })
    end
  end

  context "get audiences" do
    it "should get list of audiences" do
      stub_request(:get, "https://api.courier.com/audiences")
        .with(
          body: {},
          headers: TOKEN_AUTH_HEADERS
        )
        .to_return(body: '{"items":[{"created_at":"2022-03-21T00:56:14.860Z","description":"Updated descriptionss","id":"my-favorite-pigeons-1","name":"My favorite software dasdfengineersss","filter":{"operator":"AND","rules":[{"path":"profile.location","value":"SanFrancisco","operator":"EQ"},{"path":"profile.title","value":"SoftwareEngineer","operator":"EQ"}]},"updated_at":"2022-03-21T05:16:57.031Z"}],"paging":{"cursor":null,"more":false}}', status: 200)

      res = client.audiences.get_audiences(cursor: nil)

      expect(res).to eq({
        "items" => [
          "created_at" => "2022-03-21T00:56:14.860Z",
          "description" => "Updated descriptionss",
          "id" => "my-favorite-pigeons-1",
          "name" => "My favorite software dasdfengineersss",
          "filter" => {"operator" => "AND", "rules" => [{"path" => "profile.location", "value" => "SanFrancisco", "operator" => "EQ"}, {"path" => "profile.title", "value" => "SoftwareEngineer", "operator" => "EQ"}]},
          "updated_at" => "2022-03-21T05:16:57.031Z"
        ],
        "paging" => {
          "cursor" => nil,
          "more" => false
        }
      })
    end
  end

  context "get audience members" do
    it "should get list of audiences" do
      stub_request(:get, "https://api.courier.com/audiences/software-engineers-from-sf/members")
        .with(
          body: {},
          headers: TOKEN_AUTH_HEADERS
        )
        .to_return(body: '{"items":[{"added_at": "2022-03-24T05:31:24.291Z", "audience_id": "software-engineers-from-sf", "audience_version": 8, "member_id": "suhas_slack_1", "reason": "EQ(\'title\', \'Software Engineer\') => true"}],"paging":{"cursor":null,"more":false}}', status: 200)

      res = client.audiences.get_audience_members(audience_id: "software-engineers-from-sf", cursor: nil)

      expect(res).to eq({
        "items" => [
          "added_at" => "2022-03-24T05:31:24.291Z",
          "audience_id" => "software-engineers-from-sf",
          "audience_version" => 8,
          "member_id" => "suhas_slack_1",
          "reason" => "EQ('title', 'Software Engineer') => true"
        ],
        "paging" => {
          "cursor" => nil,
          "more" => false
        }
      })
    end
  end
end
