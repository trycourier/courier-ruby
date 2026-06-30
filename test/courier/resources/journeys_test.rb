# frozen_string_literal: true

require_relative "../test_helper"

class Courier::Test::Resources::JourneysTest < Courier::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @courier.journeys.create(
        name: "Welcome Journey",
        nodes: [{trigger_type: :"api-invoke", type: :trigger}, {trigger_type: :"api-invoke", type: :trigger}]
      )

    assert_pattern do
      response => Courier::JourneyResponse
    end

    assert_pattern do
      response => {
        id: String,
        created: Integer | nil,
        creator: String | nil,
        enabled: Courier::Internal::Type::Boolean,
        name: String,
        nodes: ^(Courier::Internal::Type::ArrayOf[union: Courier::JourneyNode]),
        published: Integer | nil,
        state: Courier::JourneyState,
        updated: Integer | nil,
        updater: String | nil
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @courier.journeys.retrieve("x")

    assert_pattern do
      response => Courier::JourneyResponse
    end

    assert_pattern do
      response => {
        id: String,
        created: Integer | nil,
        creator: String | nil,
        enabled: Courier::Internal::Type::Boolean,
        name: String,
        nodes: ^(Courier::Internal::Type::ArrayOf[union: Courier::JourneyNode]),
        published: Integer | nil,
        state: Courier::JourneyState,
        updated: Integer | nil,
        updater: String | nil
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @courier.journeys.list

    assert_pattern do
      response => Courier::JourneysListResponse
    end

    assert_pattern do
      response => {
        cursor: String | nil,
        templates: ^(Courier::Internal::Type::ArrayOf[Courier::Journey]) | nil
      }
    end
  end

  def test_archive
    skip("Mock server tests are disabled")

    response = @courier.journeys.archive("x")

    assert_pattern do
      response => nil
    end
  end

  def test_cancel_required_params
    skip("Mock server tests are disabled")

    response = @courier.journeys.cancel(cancel_journey_request: {cancelation_token: "order-1234"})

    assert_pattern do
      response => Courier::CancelJourneyResponse
    end

    assert_pattern do
      case response
      in Courier::CancelJourneyResponse::TokenBranch
      in Courier::CancelJourneyResponse::RunIDBranch
      end
    end
  end

  def test_invoke
    skip("Mock server tests are disabled")

    response = @courier.journeys.invoke("templateId")

    assert_pattern do
      response => Courier::JourneysInvokeResponse
    end

    assert_pattern do
      response => {
        run_id: String
      }
    end
  end

  def test_list_versions
    skip("Mock server tests are disabled")

    response = @courier.journeys.list_versions("x")

    assert_pattern do
      response => Courier::JourneyVersionsListResponse
    end

    assert_pattern do
      response => {
        paging: Courier::Paging,
        results: ^(Courier::Internal::Type::ArrayOf[Courier::JourneyVersionItem])
      }
    end
  end

  def test_publish
    skip("Mock server tests are disabled")

    response = @courier.journeys.publish("x")

    assert_pattern do
      response => Courier::JourneyResponse
    end

    assert_pattern do
      response => {
        id: String,
        created: Integer | nil,
        creator: String | nil,
        enabled: Courier::Internal::Type::Boolean,
        name: String,
        nodes: ^(Courier::Internal::Type::ArrayOf[union: Courier::JourneyNode]),
        published: Integer | nil,
        state: Courier::JourneyState,
        updated: Integer | nil,
        updater: String | nil
      }
    end
  end

  def test_replace_required_params
    skip("Mock server tests are disabled")

    response =
      @courier.journeys.replace(
        "x",
        name: "Welcome Journey v2",
        nodes: [{trigger_type: :"api-invoke", type: :trigger}]
      )

    assert_pattern do
      response => Courier::JourneyResponse
    end

    assert_pattern do
      response => {
        id: String,
        created: Integer | nil,
        creator: String | nil,
        enabled: Courier::Internal::Type::Boolean,
        name: String,
        nodes: ^(Courier::Internal::Type::ArrayOf[union: Courier::JourneyNode]),
        published: Integer | nil,
        state: Courier::JourneyState,
        updated: Integer | nil,
        updater: String | nil
      }
    end
  end
end
