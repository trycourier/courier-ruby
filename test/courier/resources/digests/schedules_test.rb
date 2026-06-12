# frozen_string_literal: true

require_relative "../../test_helper"

class Courier::Test::Resources::Digests::SchedulesTest < Courier::Test::ResourceTest
  def test_list_instances
    skip("Mock server tests are disabled")

    response = @courier.digests.schedules.list_instances("schedule_id")

    assert_pattern do
      response => Courier::DigestInstanceListResponse
    end

    assert_pattern do
      response => {
        has_more: Courier::Internal::Type::Boolean,
        items: ^(Courier::Internal::Type::ArrayOf[Courier::DigestInstance]),
        type: Courier::DigestInstanceListResponse::Type,
        cursor: String | nil,
        next_url: String | nil,
        url: String | nil
      }
    end
  end

  def test_release
    skip("Mock server tests are disabled")

    response = @courier.digests.schedules.release("schedule_id")

    assert_pattern do
      response => nil
    end
  end
end
