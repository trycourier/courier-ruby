# frozen_string_literal: true

require_relative "../test_helper"

class Courier::Test::Resources::PreferenceSectionsTest < Courier::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response = @courier.preference_sections.create(name: "Account Notifications")

    assert_pattern do
      response => Courier::PreferenceSectionGetResponse
    end

    assert_pattern do
      response => {
        id: String,
        created: String,
        has_custom_routing: Courier::Internal::Type::Boolean,
        name: String,
        routing_options: ^(Courier::Internal::Type::ArrayOf[enum: Courier::ChannelClassification]),
        topics: ^(Courier::Internal::Type::ArrayOf[Courier::PreferenceTopicGetResponse]),
        creator: String | nil,
        updated: String | nil,
        updater: String | nil
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @courier.preference_sections.retrieve("section_id")

    assert_pattern do
      response => Courier::PreferenceSectionGetResponse
    end

    assert_pattern do
      response => {
        id: String,
        created: String,
        has_custom_routing: Courier::Internal::Type::Boolean,
        name: String,
        routing_options: ^(Courier::Internal::Type::ArrayOf[enum: Courier::ChannelClassification]),
        topics: ^(Courier::Internal::Type::ArrayOf[Courier::PreferenceTopicGetResponse]),
        creator: String | nil,
        updated: String | nil,
        updater: String | nil
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @courier.preference_sections.list

    assert_pattern do
      response => Courier::PreferenceSectionListResponse
    end

    assert_pattern do
      response => {
        results: ^(Courier::Internal::Type::ArrayOf[Courier::PreferenceSectionGetResponse])
      }
    end
  end

  def test_archive
    skip("Mock server tests are disabled")

    response = @courier.preference_sections.archive("section_id")

    assert_pattern do
      response => nil
    end
  end

  def test_publish
    skip("Mock server tests are disabled")

    response = @courier.preference_sections.publish

    assert_pattern do
      response => Courier::PublishPreferencesResponse
    end

    assert_pattern do
      response => {
        page_id: String,
        published_at: String,
        published_version: Float,
        preview_url: String | nil,
        published_by: String | nil
      }
    end
  end

  def test_replace_required_params
    skip("Mock server tests are disabled")

    response = @courier.preference_sections.replace("section_id", name: "name")

    assert_pattern do
      response => Courier::PreferenceSectionGetResponse
    end

    assert_pattern do
      response => {
        id: String,
        created: String,
        has_custom_routing: Courier::Internal::Type::Boolean,
        name: String,
        routing_options: ^(Courier::Internal::Type::ArrayOf[enum: Courier::ChannelClassification]),
        topics: ^(Courier::Internal::Type::ArrayOf[Courier::PreferenceTopicGetResponse]),
        creator: String | nil,
        updated: String | nil,
        updater: String | nil
      }
    end
  end
end
