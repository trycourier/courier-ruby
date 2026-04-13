# frozen_string_literal: true

require_relative "../test_helper"

class Courier::Test::Resources::NotificationsTest < Courier::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @courier.notifications.create(
        notification: {
          brand: {id: "brand_abc"},
          content: {elements: [{}], version: "2022-01-01"},
          name: "Welcome Email",
          routing: {strategy_id: "rs_123"},
          subscription: {topic_id: "marketing"},
          tags: %w[onboarding welcome]
        }
      )

    assert_pattern do
      response => Courier::NotificationTemplateGetResponse
    end

    assert_pattern do
      response => {
        created: Integer,
        creator: String,
        notification: Courier::NotificationTemplateGetResponse::Notification,
        state: Courier::NotificationTemplateGetResponse::State,
        updated: Integer | nil,
        updater: String | nil
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @courier.notifications.retrieve("id")

    assert_pattern do
      response => Courier::NotificationTemplateGetResponse
    end

    assert_pattern do
      response => {
        created: Integer,
        creator: String,
        notification: Courier::NotificationTemplateGetResponse::Notification,
        state: Courier::NotificationTemplateGetResponse::State,
        updated: Integer | nil,
        updater: String | nil
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @courier.notifications.list

    assert_pattern do
      response => Courier::Models::NotificationListResponse
    end

    assert_pattern do
      response => {
        paging: Courier::Paging,
        results: ^(Courier::Internal::Type::ArrayOf[union: Courier::Models::NotificationListResponse::Result])
      }
    end
  end

  def test_archive
    skip("Mock server tests are disabled")

    response = @courier.notifications.archive("id")

    assert_pattern do
      response => nil
    end
  end

  def test_list_versions
    skip("Mock server tests are disabled")

    response = @courier.notifications.list_versions("id")

    assert_pattern do
      response => Courier::NotificationTemplateVersionListResponse
    end

    assert_pattern do
      response => {
        paging: Courier::Paging,
        versions: ^(Courier::Internal::Type::ArrayOf[Courier::VersionNode])
      }
    end
  end

  def test_publish
    skip("Mock server tests are disabled")

    response = @courier.notifications.publish("id")

    assert_pattern do
      response => nil
    end
  end

  def test_put_content_required_params
    skip("Mock server tests are disabled")

    response = @courier.notifications.put_content("id", content: {elements: [{}]})

    assert_pattern do
      response => Courier::NotificationContentMutationResponse
    end

    assert_pattern do
      response => {
        id: String,
        elements: ^(Courier::Internal::Type::ArrayOf[Courier::NotificationContentMutationResponse::Element]),
        state: Courier::NotificationTemplateState,
        version: String
      }
    end
  end

  def test_put_element_required_params
    skip("Mock server tests are disabled")

    response = @courier.notifications.put_element("elementId", id: "id", type: "text")

    assert_pattern do
      response => Courier::NotificationContentMutationResponse
    end

    assert_pattern do
      response => {
        id: String,
        elements: ^(Courier::Internal::Type::ArrayOf[Courier::NotificationContentMutationResponse::Element]),
        state: Courier::NotificationTemplateState,
        version: String
      }
    end
  end

  def test_put_locale_required_params
    skip("Mock server tests are disabled")

    response =
      @courier.notifications.put_locale("localeId", id: "id", elements: [{id: "elem_1"}, {id: "elem_2"}])

    assert_pattern do
      response => Courier::NotificationContentMutationResponse
    end

    assert_pattern do
      response => {
        id: String,
        elements: ^(Courier::Internal::Type::ArrayOf[Courier::NotificationContentMutationResponse::Element]),
        state: Courier::NotificationTemplateState,
        version: String
      }
    end
  end

  def test_replace_required_params
    skip("Mock server tests are disabled")

    response =
      @courier.notifications.replace(
        "id",
        notification: {
          brand: {id: "id"},
          content: {elements: [{}], version: "2022-01-01"},
          name: "Updated Name",
          routing: {strategy_id: "strategy_id"},
          subscription: {topic_id: "topic_id"},
          tags: ["updated"]
        }
      )

    assert_pattern do
      response => Courier::NotificationTemplateGetResponse
    end

    assert_pattern do
      response => {
        created: Integer,
        creator: String,
        notification: Courier::NotificationTemplateGetResponse::Notification,
        state: Courier::NotificationTemplateGetResponse::State,
        updated: Integer | nil,
        updater: String | nil
      }
    end
  end

  def test_retrieve_content
    skip("Mock server tests are disabled")

    response = @courier.notifications.retrieve_content("id")

    assert_pattern do
      response => Courier::Models::NotificationRetrieveContentResponse
    end

    assert_pattern do
      case response
      in Courier::NotificationContentGetResponse
      in Courier::NotificationGetContent
      end
    end
  end
end
