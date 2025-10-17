# frozen_string_literal: true

require_relative "../../test_helper"

class Trycourier::Test::Resources::Users::PreferencesTest < Trycourier::Test::ResourceTest
  def test_retrieve
    skip("Prism tests are disabled")

    response = @courier.users.preferences.retrieve("user_id")

    assert_pattern do
      response => Trycourier::Models::Users::PreferenceRetrieveResponse
    end

    assert_pattern do
      response => {
        items: ^(Trycourier::Internal::Type::ArrayOf[Trycourier::Users::TopicPreference]),
        paging: Trycourier::Paging
      }
    end
  end

  def test_retrieve_topic_required_params
    skip("Prism tests are disabled")

    response = @courier.users.preferences.retrieve_topic("topic_id", user_id: "user_id")

    assert_pattern do
      response => Trycourier::Models::Users::PreferenceRetrieveTopicResponse
    end

    assert_pattern do
      response => {
        topic: Trycourier::Users::TopicPreference
      }
    end
  end

  def test_update_or_create_topic_required_params
    skip("Prism tests are disabled")

    response =
      @courier.users.preferences.update_or_create_topic(
        "topic_id",
        user_id: "user_id",
        topic: {status: :OPTED_IN}
      )

    assert_pattern do
      response => Trycourier::Models::Users::PreferenceUpdateOrCreateTopicResponse
    end

    assert_pattern do
      response => {
        message: String
      }
    end
  end
end
