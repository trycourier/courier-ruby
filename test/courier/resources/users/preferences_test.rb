# frozen_string_literal: true

require_relative "../../test_helper"

class Courier::Test::Resources::Users::PreferencesTest < Courier::Test::ResourceTest
  def test_retrieve
    skip("Prism tests are disabled")

    response = @courier.users.preferences.retrieve("user_id")

    assert_pattern do
      response => Courier::Models::Users::PreferenceRetrieveResponse
    end

    assert_pattern do
      response => {
        items: ^(Courier::Internal::Type::ArrayOf[Courier::Users::TopicPreference]),
        paging: Courier::Paging
      }
    end
  end

  def test_retrieve_topic_required_params
    skip("Prism tests are disabled")

    response = @courier.users.preferences.retrieve_topic("topic_id", user_id: "user_id")

    assert_pattern do
      response => Courier::Models::Users::PreferenceRetrieveTopicResponse
    end

    assert_pattern do
      response => {
        topic: Courier::Users::TopicPreference
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
      response => Courier::Models::Users::PreferenceUpdateOrCreateTopicResponse
    end

    assert_pattern do
      response => {
        message: String
      }
    end
  end
end
