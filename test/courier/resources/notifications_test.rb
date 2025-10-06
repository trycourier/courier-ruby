# frozen_string_literal: true

require_relative "../test_helper"

class Courier::Test::Resources::NotificationsTest < Courier::Test::ResourceTest
  def test_list
    skip("Prism tests are disabled")

    response = @courier.notifications.list

    assert_pattern do
      response => Courier::Models::NotificationListResponse
    end

    assert_pattern do
      response => {
        paging: Courier::Paging,
        results: ^(Courier::Internal::Type::ArrayOf[Courier::Models::NotificationListResponse::Result])
      }
    end
  end

  def test_retrieve_content
    skip("Prism tests are disabled")

    response = @courier.notifications.retrieve_content("id")

    assert_pattern do
      response => Courier::NotificationContent
    end

    assert_pattern do
      response => {
        blocks: ^(Courier::Internal::Type::ArrayOf[Courier::NotificationContent::Block]) | nil,
        channels: ^(Courier::Internal::Type::ArrayOf[Courier::NotificationContent::Channel]) | nil,
        checksum: String | nil
      }
    end
  end
end
