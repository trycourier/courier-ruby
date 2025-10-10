# frozen_string_literal: true

require_relative "../../test_helper"

class Trycourier::Test::Resources::Notifications::ChecksTest < Trycourier::Test::ResourceTest
  def test_update_required_params
    skip("Prism tests are disabled")

    response =
      @courier.notifications.checks.update(
        "submissionId",
        id: "id",
        checks: [{id: "id", status: :RESOLVED, type: :custom}]
      )

    assert_pattern do
      response => Trycourier::Models::Notifications::CheckUpdateResponse
    end

    assert_pattern do
      response => {
        checks: ^(Trycourier::Internal::Type::ArrayOf[Trycourier::Check])
      }
    end
  end

  def test_list_required_params
    skip("Prism tests are disabled")

    response = @courier.notifications.checks.list("submissionId", id: "id")

    assert_pattern do
      response => Trycourier::Models::Notifications::CheckListResponse
    end

    assert_pattern do
      response => {
        checks: ^(Trycourier::Internal::Type::ArrayOf[Trycourier::Check])
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
