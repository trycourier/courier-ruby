# frozen_string_literal: true

require_relative "../test_helper"

class Trycourier::Test::Resources::MessagesTest < Trycourier::Test::ResourceTest
  def test_retrieve
    skip("Prism tests are disabled")

    response = @courier.messages.retrieve("message_id")

    assert_pattern do
      response => Trycourier::Models::MessageRetrieveResponse
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @courier.messages.list

    assert_pattern do
      response => Trycourier::Models::MessageListResponse
    end

    assert_pattern do
      response => {
        paging: Trycourier::Paging,
        results: ^(Trycourier::Internal::Type::ArrayOf[Trycourier::MessageDetails])
      }
    end
  end

  def test_cancel
    skip("Prism tests are disabled")

    response = @courier.messages.cancel("message_id")

    assert_pattern do
      response => Trycourier::MessageDetails
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
        status: Trycourier::MessageDetails::Status,
        error: String | nil,
        reason: Trycourier::MessageDetails::Reason | nil
      }
    end
  end

  def test_content
    skip("Prism tests are disabled")

    response = @courier.messages.content("message_id")

    assert_pattern do
      response => Trycourier::Models::MessageContentResponse
    end

    assert_pattern do
      response => {
        results: ^(Trycourier::Internal::Type::ArrayOf[Trycourier::Models::MessageContentResponse::Result])
      }
    end
  end

  def test_history
    skip("Prism tests are disabled")

    response = @courier.messages.history("message_id")

    assert_pattern do
      response => Trycourier::Models::MessageHistoryResponse
    end

    assert_pattern do
      response => {
        results: ^(Trycourier::Internal::Type::ArrayOf[Trycourier::Internal::Type::HashOf[Trycourier::Internal::Type::Unknown]])
      }
    end
  end
end
