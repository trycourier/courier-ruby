# frozen_string_literal: true

require_relative "../../test_helper"

class Courier::Test::Resources::Notifications::ChecksTest < Courier::Test::ResourceTest
  def test_update_required_params
    skip("Prism tests are disabled")

    response =
      @courier.notifications.checks.update(
        "submissionId",
        id: "id",
        checks: [{id: "id", status: :RESOLVED, type: :custom}]
      )

    assert_pattern do
      response => Courier::Models::Notifications::CheckUpdateResponse
    end

    assert_pattern do
      response => {
        checks: ^(Courier::Internal::Type::ArrayOf[Courier::Check])
      }
    end
  end

  def test_list_required_params
    skip("Prism tests are disabled")

    response = @courier.notifications.checks.list("submissionId", id: "id")

    assert_pattern do
      response => Courier::Models::Notifications::CheckListResponse
    end

    assert_pattern do
      response => {
        checks: ^(Courier::Internal::Type::ArrayOf[Courier::Check])
      }
    end
  end

  def test_delete_required_params
    skip("Prism tests are disabled")

    response = @courier.notifications.checks.delete("submissionId", id: "id")

    assert_pattern do
      response => nil
    end
  end
end
