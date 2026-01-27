# frozen_string_literal: true

require_relative "../../test_helper"

class Courier::Test::Resources::Lists::SubscriptionsTest < Courier::Test::ResourceTest
  def test_list
    skip("Prism tests are disabled")

    response = @courier.lists.subscriptions.list("list_id")

    assert_pattern do
      response => Courier::Models::Lists::SubscriptionListResponse
    end

    assert_pattern do
      response => {
        items: ^(Courier::Internal::Type::ArrayOf[Courier::Models::Lists::SubscriptionListResponse::Item]),
        paging: Courier::Paging
      }
    end
  end

  def test_add_required_params
    skip("Prism tests are disabled")

    response = @courier.lists.subscriptions.add("list_id", recipients: [{recipientId: "recipientId"}])

    assert_pattern do
      response => nil
    end
  end

  def test_subscribe_required_params
    skip("Prism tests are disabled")

    response = @courier.lists.subscriptions.subscribe("list_id", recipients: [{recipientId: "recipientId"}])

    assert_pattern do
      response => nil
    end
  end

  def test_subscribe_user_required_params
    skip("Prism tests are disabled")

    response = @courier.lists.subscriptions.subscribe_user("user_id", list_id: "list_id")

    assert_pattern do
      response => nil
    end
  end

  def test_unsubscribe_user_required_params
    skip("Prism tests are disabled")

    response = @courier.lists.subscriptions.unsubscribe_user("user_id", list_id: "list_id")

    assert_pattern do
      response => nil
    end
  end
end
