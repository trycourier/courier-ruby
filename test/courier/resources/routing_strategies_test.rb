# frozen_string_literal: true

require_relative "../test_helper"

class Courier::Test::Resources::RoutingStrategiesTest < Courier::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @courier.routing_strategies.create(
        name: "Email via SendGrid",
        routing: {channels: ["email"], method: :single}
      )

    assert_pattern do
      response => Courier::RoutingStrategyGetResponse
    end

    assert_pattern do
      response => {
        id: String,
        channels: ^(Courier::Internal::Type::HashOf[Courier::Channel]),
        created: Integer,
        creator: String,
        name: String,
        providers: ^(Courier::Internal::Type::HashOf[Courier::MessageProvidersType]),
        routing: Courier::MessageRouting,
        description: String | nil,
        tags: ^(Courier::Internal::Type::ArrayOf[String]) | nil,
        updated: Integer | nil,
        updater: String | nil
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @courier.routing_strategies.retrieve("id")

    assert_pattern do
      response => Courier::RoutingStrategyGetResponse
    end

    assert_pattern do
      response => {
        id: String,
        channels: ^(Courier::Internal::Type::HashOf[Courier::Channel]),
        created: Integer,
        creator: String,
        name: String,
        providers: ^(Courier::Internal::Type::HashOf[Courier::MessageProvidersType]),
        routing: Courier::MessageRouting,
        description: String | nil,
        tags: ^(Courier::Internal::Type::ArrayOf[String]) | nil,
        updated: Integer | nil,
        updater: String | nil
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @courier.routing_strategies.list

    assert_pattern do
      response => Courier::RoutingStrategyListResponse
    end

    assert_pattern do
      response => {
        paging: Courier::Paging,
        results: ^(Courier::Internal::Type::ArrayOf[Courier::RoutingStrategySummary])
      }
    end
  end

  def test_archive
    skip("Mock server tests are disabled")

    response = @courier.routing_strategies.archive("id")

    assert_pattern do
      response => nil
    end
  end

  def test_list_notifications
    skip("Mock server tests are disabled")

    response = @courier.routing_strategies.list_notifications("id")

    assert_pattern do
      response => Courier::AssociatedNotificationListResponse
    end

    assert_pattern do
      response => {
        paging: Courier::Paging,
        results: ^(Courier::Internal::Type::ArrayOf[Courier::NotificationTemplateSummary])
      }
    end
  end

  def test_replace_required_params
    skip("Mock server tests are disabled")

    response =
      @courier.routing_strategies.replace(
        "id",
        name: "Email via SendGrid v2",
        routing: {channels: ["email"], method: :single}
      )

    assert_pattern do
      response => Courier::RoutingStrategyGetResponse
    end

    assert_pattern do
      response => {
        id: String,
        channels: ^(Courier::Internal::Type::HashOf[Courier::Channel]),
        created: Integer,
        creator: String,
        name: String,
        providers: ^(Courier::Internal::Type::HashOf[Courier::MessageProvidersType]),
        routing: Courier::MessageRouting,
        description: String | nil,
        tags: ^(Courier::Internal::Type::ArrayOf[String]) | nil,
        updated: Integer | nil,
        updater: String | nil
      }
    end
  end
end
