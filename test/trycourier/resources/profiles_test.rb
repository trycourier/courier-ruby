# frozen_string_literal: true

require_relative "../test_helper"

class Trycourier::Test::Resources::ProfilesTest < Trycourier::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response = @courier.profiles.create("user_id", profile: {foo: "bar"})

    assert_pattern do
      response => Trycourier::Models::ProfileCreateResponse
    end

    assert_pattern do
      response => {
        status: Trycourier::Models::ProfileCreateResponse::Status
      }
    end
  end

  def test_retrieve
    skip("Prism tests are disabled")

    response = @courier.profiles.retrieve("user_id")

    assert_pattern do
      response => Trycourier::Models::ProfileRetrieveResponse
    end

    assert_pattern do
      response => {
        profile: ^(Trycourier::Internal::Type::HashOf[Trycourier::Internal::Type::Unknown]),
        preferences: Trycourier::RecipientPreferences | nil
      }
    end
  end

  def test_update_required_params
    skip("Prism tests are disabled")

    response = @courier.profiles.update("user_id", patch: [{op: "op", path: "path", value: "value"}])

    assert_pattern do
      response => nil
    end
  end

  def test_delete
    skip("Prism tests are disabled")

    response = @courier.profiles.delete("user_id")

    assert_pattern do
      response => nil
    end
  end

  def test_replace_required_params
    skip("Prism tests are disabled")

    response = @courier.profiles.replace("user_id", profile: {foo: "bar"})

    assert_pattern do
      response => Trycourier::Models::ProfileReplaceResponse
    end

    assert_pattern do
      response => {
        status: Trycourier::Models::ProfileReplaceResponse::Status
      }
    end
  end
end
