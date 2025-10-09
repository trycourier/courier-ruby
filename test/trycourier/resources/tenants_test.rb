# frozen_string_literal: true

require_relative "../test_helper"

class Trycourier::Test::Resources::TenantsTest < Trycourier::Test::ResourceTest
  def test_retrieve
    skip("Prism tests are disabled")

    response = @courier.tenants.retrieve("tenant_id")

    assert_pattern do
      response => Trycourier::Tenant
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        brand_id: String | nil,
        default_preferences: Trycourier::DefaultPreferences | nil,
        parent_tenant_id: String | nil,
        properties: ^(Trycourier::Internal::Type::HashOf[Trycourier::Internal::Type::Unknown]) | nil,
        user_profile: ^(Trycourier::Internal::Type::HashOf[Trycourier::Internal::Type::Unknown]) | nil
      }
    end
  end

  def test_update_required_params
    skip("Prism tests are disabled")

    response = @courier.tenants.update("tenant_id", name: "name")

    assert_pattern do
      response => Trycourier::Tenant
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        brand_id: String | nil,
        default_preferences: Trycourier::DefaultPreferences | nil,
        parent_tenant_id: String | nil,
        properties: ^(Trycourier::Internal::Type::HashOf[Trycourier::Internal::Type::Unknown]) | nil,
        user_profile: ^(Trycourier::Internal::Type::HashOf[Trycourier::Internal::Type::Unknown]) | nil
      }
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @courier.tenants.list

    assert_pattern do
      response => Trycourier::Models::TenantListResponse
    end

    assert_pattern do
      response => {
        has_more: Trycourier::Internal::Type::Boolean,
        items: ^(Trycourier::Internal::Type::ArrayOf[Trycourier::Tenant]),
        type: Trycourier::Models::TenantListResponse::Type,
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
      response => Trycourier::Models::TenantListUsersResponse
    end

    assert_pattern do
      response => {
        has_more: Trycourier::Internal::Type::Boolean,
        type: Trycourier::Models::TenantListUsersResponse::Type,
        url: String,
        cursor: String | nil,
        items: ^(Trycourier::Internal::Type::ArrayOf[Trycourier::TenantAssociation]) | nil,
        next_url: String | nil
      }
    end
  end
end
