# frozen_string_literal: true

require_relative "../../../test_helper"

class Courier::Test::Resources::Notifications::Previews::RunsTest < Courier::Test::ResourceTest
  def test_create
    skip("Mock server tests are disabled")

    response = @courier.notifications.previews.runs.create("id")

    assert_pattern do
      response => Courier::Notifications::Previews::PreviewRun
    end

    assert_pattern do
      response => {
        id: String,
        created_at: String,
        device_ids: ^(Courier::Internal::Type::ArrayOf[String]),
        status: Courier::Notifications::Previews::PreviewRunStatus,
        template_id: String,
        failure_reason: Courier::Notifications::Previews::PreviewRunFailureReason | nil,
        template_version: String | nil
      }
    end
  end

  def test_retrieve_required_params
    skip("Mock server tests are disabled")

    response = @courier.notifications.previews.runs.retrieve("previewRunId", id: "id")

    assert_pattern do
      response => Courier::Notifications::Previews::PreviewRunDetail
    end

    assert_pattern do
      response => {
        id: String,
        created_at: String,
        device_ids: ^(Courier::Internal::Type::ArrayOf[String]),
        results: ^(Courier::Internal::Type::ArrayOf[Courier::Notifications::Previews::PreviewResult]),
        status: Courier::Notifications::Previews::PreviewRunStatus,
        template_id: String,
        failure_reason: Courier::Notifications::Previews::PreviewRunFailureReason | nil,
        template_version: String | nil
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @courier.notifications.previews.runs.list("id")

    assert_pattern do
      response => Courier::Notifications::Previews::PreviewRunListResponse
    end

    assert_pattern do
      response => {
        paging: Courier::Paging,
        results: ^(Courier::Internal::Type::ArrayOf[Courier::Notifications::Previews::PreviewRun])
      }
    end
  end
end
