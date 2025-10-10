# frozen_string_literal: true

require_relative "../../test_helper"

class Trycourier::Test::Resources::Users::TenantsTest < Trycourier::Test::ResourceTest
  def test_list
    skip("Prism tests are disabled")

    response = @courier.users.tenants.list("user_id")

    assert_pattern do
      response => Trycourier::Models::Users::TenantListResponse
    end

    assert_pattern do
      response => {
        has_more: Trycourier::Internal::Type::Boolean,
        type: Trycourier::Models::Users::TenantListResponse::Type,
        url: String,
        cursor: String | nil,
        items: ^(Trycourier::Internal::Type::ArrayOf[Trycourier::TenantAssociation]) | nil,
        next_url: String | nil
      }
    end
  end

  def test_add_multiple_required_params
    skip("Prism tests are disabled")

    response = @courier.users.tenants.add_multiple("user_id", tenants: [{tenant_id: "tenant_id"}])

    assert_pattern do
      response => nil
    end
  end

  def test_add_single_required_params
    skip("Prism tests are disabled")

    response = @courier.users.tenants.add_single("tenant_id", user_id: "user_id")

    assert_pattern do
      response => nil
    end
  end

  def test_remove_all
    skip("Prism tests are disabled")

    response = @courier.users.tenants.remove_all("user_id")

    assert_pattern do
      response => nil
    end
  end

  def test_remove_single_required_params
    skip("Prism tests are disabled")

    response = @courier.users.tenants.remove_single("tenant_id", user_id: "user_id")

    assert_pattern do
      response => nil
    end
  end
end
