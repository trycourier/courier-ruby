# frozen_string_literal: true

require_relative "../../test_helper"

class Trycourier::Test::Resources::Profiles::ListsTest < Trycourier::Test::ResourceTest
  def test_retrieve
    skip("Prism tests are disabled")

    response = @courier.profiles.lists.retrieve("user_id")

    assert_pattern do
      response => Trycourier::Models::Profiles::ListRetrieveResponse
    end

    assert_pattern do
      response => {
        paging: Trycourier::Paging,
        results: ^(Trycourier::Internal::Type::ArrayOf[Trycourier::Models::Profiles::ListRetrieveResponse::Result])
      }
    end
  end

  def test_delete
    skip("Prism tests are disabled")

    response = @courier.profiles.lists.delete("user_id")

    assert_pattern do
      response => Trycourier::Models::Profiles::ListDeleteResponse
    end

    assert_pattern do
      response => {
        status: Trycourier::Models::Profiles::ListDeleteResponse::Status
      }
    end
  end

  def test_subscribe_required_params
    skip("Prism tests are disabled")

    response = @courier.profiles.lists.subscribe("user_id", lists: [{listId: "listId"}])

    assert_pattern do
      response => Trycourier::Models::Profiles::ListSubscribeResponse
    end

    assert_pattern do
      response => {
        status: Trycourier::Models::Profiles::ListSubscribeResponse::Status
      }
    end
  end
end
