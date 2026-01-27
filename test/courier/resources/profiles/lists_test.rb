# frozen_string_literal: true

require_relative "../../test_helper"

class Courier::Test::Resources::Profiles::ListsTest < Courier::Test::ResourceTest
  def test_retrieve
    skip("Prism tests are disabled")

    response = @courier.profiles.lists.retrieve("user_id")

    assert_pattern do
      response => Courier::Models::Profiles::ListRetrieveResponse
    end

    assert_pattern do
      response => {
        paging: Courier::Paging,
        results: ^(Courier::Internal::Type::ArrayOf[Courier::Models::Profiles::ListRetrieveResponse::Result])
      }
    end
  end

  def test_delete
    skip("Prism tests are disabled")

    response = @courier.profiles.lists.delete("user_id")

    assert_pattern do
      response => Courier::Models::Profiles::ListDeleteResponse
    end

    assert_pattern do
      response => {
        status: Courier::Models::Profiles::ListDeleteResponse::Status
      }
    end
  end

  def test_subscribe_required_params
    skip("Prism tests are disabled")

    response = @courier.profiles.lists.subscribe("user_id", lists: [{listId: "listId"}])

    assert_pattern do
      response => Courier::Models::Profiles::ListSubscribeResponse
    end

    assert_pattern do
      response => {
        status: Courier::Models::Profiles::ListSubscribeResponse::Status
      }
    end
  end
end
