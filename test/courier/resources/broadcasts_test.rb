# frozen_string_literal: true

require_relative "../test_helper"

class Courier::Test::Resources::BroadcastsTest < Courier::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response = @courier.broadcasts.create(channel: :email, name: "Spring Sale Announcement")

    assert_pattern do
      response => Courier::Broadcast
    end

    assert_pattern do
      response => {
        id: String,
        channel: Courier::Broadcast::Channel,
        created_at: String,
        created_by: String,
        name: String,
        status: Courier::Broadcast::Status,
        updated_at: String,
        updated_by: String,
        archived_at: String | nil,
        archived_by: String | nil,
        schedule: Courier::BroadcastSchedule | nil
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @courier.broadcasts.retrieve("broadcastId")

    assert_pattern do
      response => Courier::Broadcast
    end

    assert_pattern do
      response => {
        id: String,
        channel: Courier::Broadcast::Channel,
        created_at: String,
        created_by: String,
        name: String,
        status: Courier::Broadcast::Status,
        updated_at: String,
        updated_by: String,
        archived_at: String | nil,
        archived_by: String | nil,
        schedule: Courier::BroadcastSchedule | nil
      }
    end
  end

  def test_update_required_params
    skip("Mock server tests are disabled")

    response = @courier.broadcasts.update("broadcastId", name: "Spring Sale Announcement (v2)")

    assert_pattern do
      response => Courier::Broadcast
    end

    assert_pattern do
      response => {
        id: String,
        channel: Courier::Broadcast::Channel,
        created_at: String,
        created_by: String,
        name: String,
        status: Courier::Broadcast::Status,
        updated_at: String,
        updated_by: String,
        archived_at: String | nil,
        archived_by: String | nil,
        schedule: Courier::BroadcastSchedule | nil
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @courier.broadcasts.list

    assert_pattern do
      response => Courier::BroadcastListResponse
    end

    assert_pattern do
      response => {
        paging: Courier::Paging,
        results: ^(Courier::Internal::Type::ArrayOf[Courier::Broadcast])
      }
    end
  end

  def test_archive
    skip("Mock server tests are disabled")

    response = @courier.broadcasts.archive("broadcastId")

    assert_pattern do
      response => Courier::Broadcast
    end

    assert_pattern do
      response => {
        id: String,
        channel: Courier::Broadcast::Channel,
        created_at: String,
        created_by: String,
        name: String,
        status: Courier::Broadcast::Status,
        updated_at: String,
        updated_by: String,
        archived_at: String | nil,
        archived_by: String | nil,
        schedule: Courier::BroadcastSchedule | nil
      }
    end
  end

  def test_cancel
    skip("Mock server tests are disabled")

    response = @courier.broadcasts.cancel("broadcastId")

    assert_pattern do
      response => Courier::Broadcast
    end

    assert_pattern do
      response => {
        id: String,
        channel: Courier::Broadcast::Channel,
        created_at: String,
        created_by: String,
        name: String,
        status: Courier::Broadcast::Status,
        updated_at: String,
        updated_by: String,
        archived_at: String | nil,
        archived_by: String | nil,
        schedule: Courier::BroadcastSchedule | nil
      }
    end
  end

  def test_duplicate
    skip("Mock server tests are disabled")

    response = @courier.broadcasts.duplicate("broadcastId")

    assert_pattern do
      response => Courier::Broadcast
    end

    assert_pattern do
      response => {
        id: String,
        channel: Courier::Broadcast::Channel,
        created_at: String,
        created_by: String,
        name: String,
        status: Courier::Broadcast::Status,
        updated_at: String,
        updated_by: String,
        archived_at: String | nil,
        archived_by: String | nil,
        schedule: Courier::BroadcastSchedule | nil
      }
    end
  end

  def test_put_content_required_params
    skip("Mock server tests are disabled")

    response = @courier.broadcasts.put_content("broadcastId", content: {elements: [{}, {}]})

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

  def test_retrieve_content
    skip("Mock server tests are disabled")

    response = @courier.broadcasts.retrieve_content("broadcastId")

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

  def test_schedule_required_params
    skip("Mock server tests are disabled")

    response =
      @courier.broadcasts.schedule(
        "broadcastId",
        recipient_id: "aud_01kx4h2jdafq8bk9amzvy6hbv0",
        recipient_type: :audience,
        scheduled_to: "2026-08-01T15:00:00"
      )

    assert_pattern do
      response => Courier::Broadcast
    end

    assert_pattern do
      response => {
        id: String,
        channel: Courier::Broadcast::Channel,
        created_at: String,
        created_by: String,
        name: String,
        status: Courier::Broadcast::Status,
        updated_at: String,
        updated_by: String,
        archived_at: String | nil,
        archived_by: String | nil,
        schedule: Courier::BroadcastSchedule | nil
      }
    end
  end

  def test_send__required_params
    skip("Mock server tests are disabled")

    response =
      @courier.broadcasts.send_("broadcastId", recipient_id: "cool-customers", recipient_type: :list)

    assert_pattern do
      response => Courier::Broadcast
    end

    assert_pattern do
      response => {
        id: String,
        channel: Courier::Broadcast::Channel,
        created_at: String,
        created_by: String,
        name: String,
        status: Courier::Broadcast::Status,
        updated_at: String,
        updated_by: String,
        archived_at: String | nil,
        archived_by: String | nil,
        schedule: Courier::BroadcastSchedule | nil
      }
    end
  end
end
