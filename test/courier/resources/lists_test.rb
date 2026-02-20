# frozen_string_literal: true

require_relative "../test_helper"

class Courier::Test::Resources::ListsTest < Courier::Test::ResourceTest
  def test_retrieve
    skip("Mock server tests are disabled")

    response = @courier.lists.retrieve("list_id")

    assert_pattern do
      response => Courier::SubscriptionList
    end

    assert_pattern do
      response => {
        id: String,
        name: String,
        created: String | nil,
        updated: String | nil
      }
    end
  end

  def test_update_required_params
    skip("Mock server tests are disabled")

    response = @courier.lists.update("list_id", name: "name")

    assert_pattern do
      response => nil
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @courier.lists.list

    assert_pattern do
      response => Courier::Models::ListListResponse
    end

    assert_pattern do
      response => {
        items: ^(Courier::Internal::Type::ArrayOf[Courier::SubscriptionList]),
        paging: Courier::Paging
      }
    end
  end

  def test_delete
    skip("Mock server tests are disabled")

    response = @courier.lists.delete("list_id")

    assert_pattern do
      response => nil
    end
  end

  def test_restore
    skip("Mock server tests are disabled")

    response = @courier.lists.restore("list_id")

    assert_pattern do
      response => nil
    end
  end
end
