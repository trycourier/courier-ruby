# frozen_string_literal: true

require_relative "../test_helper"

class Courier::Test::Resources::TenantsTest < Courier::Test::ResourceTest
  def test_retrieve
    skip("Prism tests are disabled")

    response = @courier.tenants.retrieve("tenant_id")

    assert_pattern do
      response => Courier::Tenant
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        brand_id: String | nil,
        default_preferences: Courier::DefaultPreferences | nil,
        parent_tenant_id: String | nil,
        properties: ^(Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown]) | nil,
        user_profile: ^(Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown]) | nil
      }
    end
  end

  def test_update_required_params
    skip("Prism tests are disabled")

    response = @courier.tenants.update("tenant_id", name: "name")

    assert_pattern do
      response => Courier::Tenant
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        brand_id: String | nil,
        default_preferences: Courier::DefaultPreferences | nil,
        parent_tenant_id: String | nil,
        properties: ^(Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown]) | nil,
        user_profile: ^(Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown]) | nil
      }
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @courier.tenants.list

    assert_pattern do
      response => Courier::Models::TenantListResponse
    end

    assert_pattern do
      response => {
        has_more: Courier::Internal::Type::Boolean,
        items: ^(Courier::Internal::Type::ArrayOf[Courier::Tenant]),
        type: Courier::Models::TenantListResponse::Type,
        url: String,
        cursor: String | nil,
        next_url: String | nil
      }
    end
  end

  def test_delete
    skip("Prism tests are disabled")

    response = @courier.tenants.delete("tenant_id")

    assert_pattern do
      response => nil
    end
  end

  def test_list_users
    skip("Prism tests are disabled")

    response = @courier.tenants.list_users("tenant_id")

    assert_pattern do
      response => Courier::Models::TenantListUsersResponse
    end

    assert_pattern do
      response => {
        has_more: Courier::Internal::Type::Boolean,
        type: Courier::Models::TenantListUsersResponse::Type,
        url: String,
        cursor: String | nil,
        items: ^(Courier::Internal::Type::ArrayOf[Courier::TenantAssociation]) | nil,
        next_url: String | nil
      }
    end
  end
end
