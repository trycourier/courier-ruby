# frozen_string_literal: true

require_relative "../../../test_helper"

class Courier::Test::Resources::Tenants::DefaultPreferences::ItemsTest < Courier::Test::ResourceTest
  def test_update_required_params
    skip("Prism tests are disabled")

    response =
      @courier.tenants.default_preferences.items.update("topic_id", tenant_id: "tenant_id", status: :OPTED_IN)

    assert_pattern do
      response => nil
    end
  end

  def test_delete_required_params
    skip("Prism tests are disabled")

    response = @courier.tenants.default_preferences.items.delete("topic_id", tenant_id: "tenant_id")

    assert_pattern do
      response => nil
    end
  end
end
