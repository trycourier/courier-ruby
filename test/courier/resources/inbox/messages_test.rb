# frozen_string_literal: true

require_relative "../../test_helper"

class Courier::Test::Resources::Inbox::MessagesTest < Courier::Test::ResourceTest
  def test_delete
    skip("Mock server tests are disabled")

    response = @courier.inbox.messages.delete("message_id")

    assert_pattern do
      response => nil
    end
  end

  def test_restore
    skip("Mock server tests are disabled")

    response = @courier.inbox.messages.restore("message_id")

    assert_pattern do
      response => nil
    end
  end
end
