# frozen_string_literal: true

require_relative "../test_helper"

class Courier::Test::Resources::ProfilesTest < Courier::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response = @courier.profiles.create("user_id", profile: {foo: "bar"})

    assert_pattern do
      response => Courier::Models::ProfileCreateResponse
    end

    assert_pattern do
      response => {
        status: Courier::Models::ProfileCreateResponse::Status
      }
    end
  end

  def test_retrieve
    skip("Prism tests are disabled")

    response = @courier.profiles.retrieve("user_id")

    assert_pattern do
      response => Courier::Models::ProfileRetrieveResponse
    end

    assert_pattern do
      response => {
        profile: ^(Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown]),
        preferences: Courier::Lists::RecipientPreferences | nil
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
      response => Courier::Models::ProfileReplaceResponse
    end

    assert_pattern do
      response => {
        status: Courier::Models::ProfileReplaceResponse::Status
      }
    end
  end
end
