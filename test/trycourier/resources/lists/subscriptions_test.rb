# frozen_string_literal: true

require_relative "../../test_helper"

class Trycourier::Test::Resources::Lists::SubscriptionsTest < Trycourier::Test::ResourceTest
  def test_list
    skip("Prism tests are disabled")

    response = @courier.lists.subscriptions.list("list_id")

    assert_pattern do
      response => Trycourier::Models::Lists::SubscriptionListResponse
    end

    assert_pattern do
      response => {
        items: ^(Trycourier::Internal::Type::ArrayOf[Trycourier::Models::Lists::SubscriptionListResponse::Item]),
        paging: Trycourier::Paging
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
