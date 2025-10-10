# frozen_string_literal: true

require_relative "../test_helper"

class Trycourier::Test::Resources::AudiencesTest < Trycourier::Test::ResourceTest
  def test_retrieve
    skip("Prism tests are disabled")

    response = @courier.audiences.retrieve("audience_id")

    assert_pattern do
      response => Trycourier::Audience
    end

    assert_pattern do
      response => {
        id: String,
        created_at: String,
        description: String,
        filter: Trycourier::Filter,
        name: String,
        updated_at: String
      }
    end
  end

  def test_update
    skip("Prism tests are disabled")

    response = @courier.audiences.update("audience_id")

    assert_pattern do
      response => Trycourier::Models::AudienceUpdateResponse
    end

    assert_pattern do
      response => {
        audience: Trycourier::Audience
      }
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @courier.audiences.list

    assert_pattern do
      response => Trycourier::Models::AudienceListResponse
    end

    assert_pattern do
      response => {
        items: ^(Trycourier::Internal::Type::ArrayOf[Trycourier::Audience]),
        paging: Trycourier::Paging
      }
    end
  end

  def test_delete
    skip("Prism tests are disabled")

    response = @courier.audiences.delete("audience_id")

    assert_pattern do
      response => nil
    end
  end

  def test_list_members
    skip("Prism tests are disabled")

    response = @courier.audiences.list_members("audience_id")

    assert_pattern do
      response => Trycourier::Models::AudienceListMembersResponse
    end

    assert_pattern do
      response => {
        items: ^(Trycourier::Internal::Type::ArrayOf[Trycourier::Models::AudienceListMembersResponse::Item]),
        paging: Trycourier::Paging
      }
    end
  end
end
