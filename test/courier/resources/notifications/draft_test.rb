# frozen_string_literal: true

require_relative "../../test_helper"

class Courier::Test::Resources::Notifications::DraftTest < Courier::Test::ResourceTest
  def test_retrieve_content
    skip("Prism tests are disabled")

    response = @courier.notifications.draft.retrieve_content("id")

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
