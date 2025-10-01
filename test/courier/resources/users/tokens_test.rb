# frozen_string_literal: true

require_relative "../../test_helper"

class Courier::Test::Resources::Users::TokensTest < Courier::Test::ResourceTest
  def test_update_required_params
    skip("Prism tests are disabled")

    response = @courier.users.tokens.update("token", user_id: "user_id", patch: [{op: "op", path: "path"}])

    assert_pattern do
      response => nil
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @courier.users.tokens.list("user_id")

    assert_pattern do
      response => ^(Courier::Internal::Type::ArrayOf[Courier::Users::UserToken])
    end
  end

  def test_delete_required_params
    skip("Prism tests are disabled")

    response = @courier.users.tokens.delete("token", user_id: "user_id")

    assert_pattern do
      response => nil
    end
  end

  def test_add_multiple
    skip("Prism tests are disabled")

    response = @courier.users.tokens.add_multiple("user_id")

    assert_pattern do
      response => nil
    end
  end

  def test_add_single_required_params
    skip("Prism tests are disabled")

    response = @courier.users.tokens.add_single("token", user_id: "user_id", provider_key: :"firebase-fcm")

    assert_pattern do
      response => nil
    end
  end

  def test_retrieve_single_required_params
    skip("Prism tests are disabled")

    response = @courier.users.tokens.retrieve_single("token", user_id: "user_id")

    assert_pattern do
      response => Courier::Models::Users::TokenRetrieveSingleResponse
    end
  end
end
