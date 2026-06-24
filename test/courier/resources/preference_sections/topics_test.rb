# frozen_string_literal: true

require_relative "../../test_helper"

class Courier::Test::Resources::PreferenceSections::TopicsTest < Courier::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @courier.preference_sections.topics.create("section_id", default_status: :OPTED_OUT, name: "Marketing")

    assert_pattern do
      response => Courier::PreferenceTopicGetResponse
    end

    assert_pattern do
      response => {
        id: String,
        allowed_preferences: ^(Courier::Internal::Type::ArrayOf[enum: Courier::PreferenceTopicGetResponse::AllowedPreference]),
        created: String,
        default_status: Courier::PreferenceTopicGetResponse::DefaultStatus,
        include_unsubscribe_header: Courier::Internal::Type::Boolean,
        name: String,
        routing_options: ^(Courier::Internal::Type::ArrayOf[enum: Courier::ChannelClassification]),
        topic_data: ^(Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown]),
        updated: String,
        creator: String | nil,
        updater: String | nil
      }
    end
  end

  def test_retrieve_required_params
    skip("Mock server tests are disabled")

    response = @courier.preference_sections.topics.retrieve("topic_id", section_id: "section_id")

    assert_pattern do
      response => Courier::PreferenceTopicGetResponse
    end

    assert_pattern do
      response => {
        id: String,
        allowed_preferences: ^(Courier::Internal::Type::ArrayOf[enum: Courier::PreferenceTopicGetResponse::AllowedPreference]),
        created: String,
        default_status: Courier::PreferenceTopicGetResponse::DefaultStatus,
        include_unsubscribe_header: Courier::Internal::Type::Boolean,
        name: String,
        routing_options: ^(Courier::Internal::Type::ArrayOf[enum: Courier::ChannelClassification]),
        topic_data: ^(Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown]),
        updated: String,
        creator: String | nil,
        updater: String | nil
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @courier.preference_sections.topics.list("section_id")

    assert_pattern do
      response => Courier::PreferenceTopicListResponse
    end

    assert_pattern do
      response => {
        results: ^(Courier::Internal::Type::ArrayOf[Courier::PreferenceTopicGetResponse])
      }
    end
  end

  def test_archive_required_params
    skip("Mock server tests are disabled")

    response = @courier.preference_sections.topics.archive("topic_id", section_id: "section_id")

    assert_pattern do
      response => nil
    end
  end

  def test_replace_required_params
    skip("Mock server tests are disabled")

    response =
      @courier.preference_sections.topics.replace(
        "topic_id",
        section_id: "section_id",
        default_status: :OPTED_OUT,
        name: "name"
      )

    assert_pattern do
      response => Courier::PreferenceTopicGetResponse
    end

    assert_pattern do
      response => {
        id: String,
        allowed_preferences: ^(Courier::Internal::Type::ArrayOf[enum: Courier::PreferenceTopicGetResponse::AllowedPreference]),
        created: String,
        default_status: Courier::PreferenceTopicGetResponse::DefaultStatus,
        include_unsubscribe_header: Courier::Internal::Type::Boolean,
        name: String,
        routing_options: ^(Courier::Internal::Type::ArrayOf[enum: Courier::ChannelClassification]),
        topic_data: ^(Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown]),
        updated: String,
        creator: String | nil,
        updater: String | nil
      }
    end
  end
end
