# frozen_string_literal: true

require_relative "../test_helper"

class Courier::Test::Resources::MessagesTest < Courier::Test::ResourceTest
  def test_retrieve
    skip("Prism tests are disabled")

    response = @courier.messages.retrieve("message_id")

    assert_pattern do
      response => Courier::Models::MessageRetrieveResponse
    end
  end

  def test_list
    skip("Prism tests are disabled")

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
    skip("Prism tests are disabled")

    response = @courier.messages.cancel("message_id")

    assert_pattern do
      response => Courier::MessageDetails
    end

    assert_pattern do
      response => {
        id: String,
        clicked: Integer,
        delivered: Integer,
        enqueued: Integer,
        event: String,
        notification: String,
        opened: Integer,
        recipient: String,
        sent: Integer,
        status: Courier::MessageDetails::Status,
        error: String | nil,
        reason: Courier::MessageDetails::Reason | nil
      }
    end
  end

  def test_get_content
    skip("Prism tests are disabled")

    response = @courier.messages.get_content("message_id")

    assert_pattern do
      response => Courier::Models::MessageGetContentResponse
    end

    assert_pattern do
      response => {
        results: ^(Courier::Internal::Type::ArrayOf[Courier::Models::MessageGetContentResponse::Result])
      }
    end
  end

  def test_history
    skip("Prism tests are disabled")

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
