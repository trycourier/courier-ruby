# frozen_string_literal: true

require_relative "../test_helper"

class Courier::Test::Resources::BulkTest < Courier::Test::ResourceTest
  def test_add_users_required_params
    skip("Prism tests are disabled")

    response = @courier.bulk.add_users("job_id", users: [{}])

    assert_pattern do
      response => nil
    end
  end

  def test_create_job_required_params
    skip("Prism tests are disabled")

    response = @courier.bulk.create_job(message: {template: "template"})

    assert_pattern do
      response => Courier::Models::BulkCreateJobResponse
    end

    assert_pattern do
      response => {
        job_id: String
      }
    end
  end

  def test_list_users
    skip("Prism tests are disabled")

    response = @courier.bulk.list_users("job_id")

    assert_pattern do
      response => Courier::Models::BulkListUsersResponse
    end

    assert_pattern do
      response => {
        items: ^(Courier::Internal::Type::ArrayOf[Courier::Models::BulkListUsersResponse::Item]),
        paging: Courier::Paging
      }
    end
  end

  def test_retrieve_job
    skip("Prism tests are disabled")

    response = @courier.bulk.retrieve_job("job_id")

    assert_pattern do
      response => Courier::Models::BulkRetrieveJobResponse
    end

    assert_pattern do
      response => {
        job: Courier::Models::BulkRetrieveJobResponse::Job
      }
    end
  end

  def test_run_job
    skip("Prism tests are disabled")

    response = @courier.bulk.run_job("job_id")

    assert_pattern do
      response => nil
    end
  end
end
