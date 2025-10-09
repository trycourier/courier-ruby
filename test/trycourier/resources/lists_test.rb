# frozen_string_literal: true

require_relative "../test_helper"

class Trycourier::Test::Resources::ListsTest < Trycourier::Test::ResourceTest
  def test_retrieve
    skip("Prism tests are disabled")

    response = @courier.lists.retrieve("list_id")

    assert_pattern do
      response => Trycourier::UserList
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
    skip("Prism tests are disabled")

    response = @courier.lists.update("list_id", name: "name")

    assert_pattern do
      response => nil
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @courier.lists.list

    assert_pattern do
      response => Trycourier::Models::ListListResponse
    end

    assert_pattern do
      response => {
        items: ^(Trycourier::Internal::Type::ArrayOf[Trycourier::UserList]),
        paging: Trycourier::Paging
      }
    end
  end

  def test_delete
    skip("Prism tests are disabled")

    response = @courier.lists.delete("list_id")

    assert_pattern do
      response => nil
    end
  end

  def test_restore
    skip("Prism tests are disabled")

    response = @courier.lists.restore("list_id")

    assert_pattern do
      response => nil
    end
  end
end
