# frozen_string_literal: true

require_relative "../../../test_helper"

class Courier::Test::Resources::Tenants::Templates::VersionsTest < Courier::Test::ResourceTest
  def test_retrieve_required_params
    skip("Prism tests are disabled")

    response =
      @courier.tenants.templates.versions.retrieve(
        "version",
        tenant_id: "tenant_id",
        template_id: "template_id"
      )

    assert_pattern do
      response => Courier::BaseTemplateTenantAssociation
    end

    assert_pattern do
      response => {
        id: String,
        created_at: String,
        published_at: String,
        updated_at: String,
        version: String
      }
    end
  end
end
