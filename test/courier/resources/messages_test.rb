# frozen_string_literal: true

require_relative "../test_helper"

class Courier::Test::Resources::MessagesTest < Courier::Test::ResourceTest
  def test_retrieve
    skip("Mock server tests are disabled")

    response = @courier.messages.retrieve("message_id")

    assert_pattern do
      response => Courier::Models::MessageRetrieveResponse
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @courier.messages.list

    assert_pattern do
      response => Courier::Models::MessageListResponse
    end

    assert_pattern do
      response => {
        paging: Courier::Paging,
        results: ^(Courier::Internal::Type::ArrayOf[Courier::MessageDetails])
      }
    end
  end

  def test_cancel
    skip("Mock server tests are disabled")

    response = @courier.messages.cancel("message_id")

    assert_pattern do
      response => Courier::MessageDetails
    end

    assert_pattern do
      response => {
        id: String,
        enqueued: Integer,
        event: String,
        notification: String,
        recipient: String,
        status: Courier::MessageDetails::Status,
        clicked: Integer | nil,
        delivered: Integer | nil,
        error: String | nil,
        opened: Integer | nil,
        reason: Courier::MessageDetails::Reason | nil,
        sent: Integer | nil
      }
    end
  end

  def test_content
    skip("Mock server tests are disabled")

    response = @courier.messages.content("message_id")

    assert_pattern do
      response => Courier::Models::MessageContentResponse
    end

    assert_pattern do
      response => {
        results: ^(Courier::Internal::Type::ArrayOf[Courier::Models::MessageContentResponse::Result])
      }
    end
  end

  def test_history
    skip("Mock server tests are disabled")

    response = @courier.messages.history("message_id")

    assert_pattern do
      response => Courier::Models::MessageHistoryResponse
    end

    assert_pattern do
      response => {
        results: ^(Courier::Internal::Type::ArrayOf[Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown]])
      }
    end
  end
end
