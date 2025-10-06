# frozen_string_literal: true

require_relative "../test_helper"

class Courier::Test::Resources::AudiencesTest < Courier::Test::ResourceTest
  def test_retrieve
    skip("Prism tests are disabled")

    response = @courier.audiences.retrieve("audience_id")

    assert_pattern do
      response => Courier::Audience
    end

    assert_pattern do
      response => {
        id: String,
        created_at: String,
        description: String,
        filter: Courier::Filter,
        name: String,
        updated_at: String
      }
    end
  end

  def test_update
    skip("Prism tests are disabled")

    response = @courier.audiences.update("audience_id")

    assert_pattern do
      response => Courier::Models::AudienceUpdateResponse
    end

    assert_pattern do
      response => {
        audience: Courier::Audience
      }
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @courier.audiences.list

    assert_pattern do
      response => Courier::Models::AudienceListResponse
    end

    assert_pattern do
      response => {
        items: ^(Courier::Internal::Type::ArrayOf[Courier::Audience]),
        paging: Courier::Paging
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
      response => Courier::Models::AudienceListMembersResponse
    end

    assert_pattern do
      response => {
        items: ^(Courier::Internal::Type::ArrayOf[Courier::Models::AudienceListMembersResponse::Item]),
        paging: Courier::Paging
      }
    end
  end
end
