# frozen_string_literal: true

require_relative "../test_helper"

class Courier::Test::Resources::WorkspacePreferencesTest < Courier::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response = @courier.workspace_preferences.create(name: "Account Notifications")

    assert_pattern do
      response => Courier::WorkspacePreferenceGetResponse
    end

    assert_pattern do
      response => {
        id: String,
        created: String,
        has_custom_routing: Courier::Internal::Type::Boolean,
        name: String,
        routing_options: ^(Courier::Internal::Type::ArrayOf[enum: Courier::ChannelClassification]),
        topics: ^(Courier::Internal::Type::ArrayOf[Courier::WorkspacePreferenceTopicGetResponse]),
        creator: String | nil,
        description: String | nil,
        updated: String | nil,
        updater: String | nil
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @courier.workspace_preferences.retrieve("section_id")

    assert_pattern do
      response => Courier::WorkspacePreferenceGetResponse
    end

    assert_pattern do
      response => {
        id: String,
        created: String,
        has_custom_routing: Courier::Internal::Type::Boolean,
        name: String,
        routing_options: ^(Courier::Internal::Type::ArrayOf[enum: Courier::ChannelClassification]),
        topics: ^(Courier::Internal::Type::ArrayOf[Courier::WorkspacePreferenceTopicGetResponse]),
        creator: String | nil,
        description: String | nil,
        updated: String | nil,
        updater: String | nil
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @courier.workspace_preferences.list

    assert_pattern do
      response => Courier::WorkspacePreferenceListResponse
    end

    assert_pattern do
      response => {
        results: ^(Courier::Internal::Type::ArrayOf[Courier::WorkspacePreferenceGetResponse])
      }
    end
  end

  def test_archive
    skip("Mock server tests are disabled")

    response = @courier.workspace_preferences.archive("section_id")

    assert_pattern do
      response => nil
    end
  end

  def test_publish
    skip("Mock server tests are disabled")

    response = @courier.workspace_preferences.publish

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

    response = @courier.workspace_preferences.replace("section_id", name: "name")

    assert_pattern do
      response => Courier::WorkspacePreferenceGetResponse
    end

    assert_pattern do
      response => {
        id: String,
        created: String,
        has_custom_routing: Courier::Internal::Type::Boolean,
        name: String,
        routing_options: ^(Courier::Internal::Type::ArrayOf[enum: Courier::ChannelClassification]),
        topics: ^(Courier::Internal::Type::ArrayOf[Courier::WorkspacePreferenceTopicGetResponse]),
        creator: String | nil,
        description: String | nil,
        updated: String | nil,
        updater: String | nil
      }
    end
  end
end
