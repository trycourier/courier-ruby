# frozen_string_literal: true

require_relative "../../test_helper"

class Courier::Test::Resources::Journeys::TemplatesTest < Courier::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @courier.journeys.templates.create(
        "x",
        channel: "email",
        notification: {
          brand: {id: "id"},
          content: {elements: [{}], version: :"2022-01-01"},
          name: "Welcome email",
          subscription: {topic_id: "topic_id"},
          tags: ["string"]
        }
      )

    assert_pattern do
      response => Courier::JourneyTemplateGetResponse
    end

    assert_pattern do
      response => {
        id: String,
        brand: Courier::JourneyTemplateGetResponse::Brand | nil,
        content: Courier::JourneyTemplateGetResponse::Content,
        created: Integer,
        creator: String,
        name: String,
        state: Courier::JourneyTemplateGetResponse::State,
        subscription: Courier::JourneyTemplateGetResponse::Subscription | nil,
        tags: ^(Courier::Internal::Type::ArrayOf[String]),
        updated: Integer | nil,
        updater: String | nil
      }
    end
  end

  def test_retrieve_required_params
    skip("Mock server tests are disabled")

    response = @courier.journeys.templates.retrieve("x", template_id: "x")

    assert_pattern do
      response => Courier::JourneyTemplateGetResponse
    end

    assert_pattern do
      response => {
        id: String,
        brand: Courier::JourneyTemplateGetResponse::Brand | nil,
        content: Courier::JourneyTemplateGetResponse::Content,
        created: Integer,
        creator: String,
        name: String,
        state: Courier::JourneyTemplateGetResponse::State,
        subscription: Courier::JourneyTemplateGetResponse::Subscription | nil,
        tags: ^(Courier::Internal::Type::ArrayOf[String]),
        updated: Integer | nil,
        updater: String | nil
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @courier.journeys.templates.list("x")

    assert_pattern do
      response => Courier::JourneyTemplateListResponse
    end

    assert_pattern do
      response => {
        paging: Courier::Paging,
        results: ^(Courier::Internal::Type::ArrayOf[Courier::JourneyTemplateSummary])
      }
    end
  end

  def test_archive_required_params
    skip("Mock server tests are disabled")

    response = @courier.journeys.templates.archive("x", template_id: "x")

    assert_pattern do
      response => nil
    end
  end

  def test_list_versions_required_params
    skip("Mock server tests are disabled")

    response = @courier.journeys.templates.list_versions("x", template_id: "x")

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

  def test_publish_required_params
    skip("Mock server tests are disabled")

    response = @courier.journeys.templates.publish("x", template_id: "x")

    assert_pattern do
      response => nil
    end
  end

  def test_put_content_required_params
    skip("Mock server tests are disabled")

    response = @courier.journeys.templates.put_content("x", template_id: "x", content: {elements: [{}]})

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
      @courier.journeys.templates.put_locale(
        "x",
        template_id: "x",
        notification_id: "x",
        elements: [{id: "elem_1"}, {id: "elem_2"}]
      )

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
      @courier.journeys.templates.replace(
        "x",
        template_id: "x",
        notification: {
          brand: {id: "id"},
          content: {elements: [{}], version: :"2022-01-01"},
          name: "name",
          subscription: {topic_id: "topic_id"},
          tags: ["string"]
        }
      )

    assert_pattern do
      response => Courier::JourneyTemplateGetResponse
    end

    assert_pattern do
      response => {
        id: String,
        brand: Courier::JourneyTemplateGetResponse::Brand | nil,
        content: Courier::JourneyTemplateGetResponse::Content,
        created: Integer,
        creator: String,
        name: String,
        state: Courier::JourneyTemplateGetResponse::State,
        subscription: Courier::JourneyTemplateGetResponse::Subscription | nil,
        tags: ^(Courier::Internal::Type::ArrayOf[String]),
        updated: Integer | nil,
        updater: String | nil
      }
    end
  end

  def test_retrieve_content_required_params
    skip("Mock server tests are disabled")

    response = @courier.journeys.templates.retrieve_content("x", template_id: "x")

    assert_pattern do
      response => Courier::NotificationContentGetResponse
    end

    assert_pattern do
      response => {
        elements: ^(Courier::Internal::Type::ArrayOf[Courier::ElementWithChecksums]),
        version: String
      }
    end
  end
end
