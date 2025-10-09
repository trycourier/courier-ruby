# frozen_string_literal: true

require_relative "../test_helper"

class Trycourier::Test::Resources::BulkTest < Trycourier::Test::ResourceTest
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
      response => Trycourier::Models::BulkCreateJobResponse
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
      response => Trycourier::Models::BulkListUsersResponse
    end

    assert_pattern do
      response => {
        items: ^(Trycourier::Internal::Type::ArrayOf[Trycourier::Models::BulkListUsersResponse::Item]),
        paging: Trycourier::Paging
      }
    end
  end

  def test_retrieve_job
    skip("Prism tests are disabled")

    response = @courier.bulk.retrieve_job("job_id")

    assert_pattern do
      response => Trycourier::Models::BulkRetrieveJobResponse
    end

    assert_pattern do
      response => {
        job: Trycourier::Models::BulkRetrieveJobResponse::Job
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
