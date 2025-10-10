# frozen_string_literal: true

require_relative "../../test_helper"

class Trycourier::Test::Resources::Tenants::TemplatesTest < Trycourier::Test::ResourceTest
  def test_retrieve_required_params
    skip("Prism tests are disabled")

    response = @courier.tenants.templates.retrieve("template_id", tenant_id: "tenant_id")

    assert_pattern do
      response => Trycourier::BaseTemplateTenantAssociation
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
      response => Trycourier::Models::Tenants::TemplateListResponse
    end

    assert_pattern do
      response => {
        has_more: Trycourier::Internal::Type::Boolean,
        type: Trycourier::Models::Tenants::TemplateListResponse::Type,
        url: String,
        cursor: String | nil,
        items: ^(Trycourier::Internal::Type::ArrayOf[Trycourier::Models::Tenants::TemplateListResponse::Item]) | nil,
        next_url: String | nil
      }
    end
  end
end
