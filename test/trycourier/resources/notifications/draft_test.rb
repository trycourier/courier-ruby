# frozen_string_literal: true

require_relative "../../test_helper"

class Trycourier::Test::Resources::Notifications::DraftTest < Trycourier::Test::ResourceTest
  def test_retrieve_content
    skip("Prism tests are disabled")

    response = @courier.notifications.draft.retrieve_content("id")

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
