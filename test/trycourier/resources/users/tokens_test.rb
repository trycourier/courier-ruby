# frozen_string_literal: true

require_relative "../../test_helper"

class Trycourier::Test::Resources::Users::TokensTest < Trycourier::Test::ResourceTest
  def test_retrieve_required_params
    skip("Prism tests are disabled")

    response = @courier.users.tokens.retrieve("token", user_id: "user_id")

    assert_pattern do
      response => Trycourier::Models::Users::TokenRetrieveResponse
    end
  end

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
      response => Trycourier::Models::Users::TokenListResponse
    end

    assert_pattern do
      response => {
        tokens: ^(Trycourier::Internal::Type::ArrayOf[Trycourier::Users::UserToken])
      }
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

    response =
      @courier.users.tokens.add_single(
        "token",
        user_id: "user_id",
        body_token: "token",
        provider_key: :"firebase-fcm"
      )

    assert_pattern do
      response => nil
    end
  end
end
