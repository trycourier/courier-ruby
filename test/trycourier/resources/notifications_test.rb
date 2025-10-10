# frozen_string_literal: true

require_relative "../test_helper"

class Trycourier::Test::Resources::NotificationsTest < Trycourier::Test::ResourceTest
  def test_list
    skip("Prism tests are disabled")

    response = @courier.notifications.list

    assert_pattern do
      response => Trycourier::Models::NotificationListResponse
    end

    assert_pattern do
      response => {
        paging: Trycourier::Paging,
        results: ^(Trycourier::Internal::Type::ArrayOf[Trycourier::Models::NotificationListResponse::Result])
      }
    end
  end

  def test_retrieve_content
    skip("Prism tests are disabled")

    response = @courier.notifications.retrieve_content("id")

    assert_pattern do
      response => Trycourier::NotificationGetContent
    end

    assert_pattern do
      response => {
        blocks: ^(Trycourier::Internal::Type::ArrayOf[Trycourier::NotificationGetContent::Block]) | nil,
        channels: ^(Trycourier::Internal::Type::ArrayOf[Trycourier::NotificationGetContent::Channel]) | nil,
        checksum: String | nil
      }
    end
  end
end
