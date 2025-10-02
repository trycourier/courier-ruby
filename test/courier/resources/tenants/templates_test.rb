# frozen_string_literal: true

require_relative "../../test_helper"

class Courier::Test::Resources::Tenants::TemplatesTest < Courier::Test::ResourceTest
  def test_retrieve_required_params
    skip("Prism tests are disabled")

    response = @courier.tenants.templates.retrieve("template_id", tenant_id: "tenant_id")

    assert_pattern do
      response => Courier::Tenants::BaseTemplateTenantAssociation
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

  def test_list
    skip("Prism tests are disabled")

    response = @courier.tenants.templates.list("tenant_id")

    assert_pattern do
      response => Courier::Models::Tenants::TemplateListResponse
    end

    assert_pattern do
      response => {
        has_more: Courier::Internal::Type::Boolean,
        type: Courier::Models::Tenants::TemplateListResponse::Type,
        url: String,
        cursor: String | nil,
        items: ^(Courier::Internal::Type::ArrayOf[Courier::Models::Tenants::TemplateListResponse::Item]) | nil,
        next_url: String | nil
      }
    end
  end
end
