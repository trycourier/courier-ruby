# frozen_string_literal: true

require_relative "../test_helper"

class Courier::Test::Resources::PreviewsTest < Courier::Test::ResourceTest
  def test_archive_device_set
    skip("Mock server tests are disabled")

    response = @courier.previews.archive_device_set("deviceSetId")

    assert_pattern do
      response => Courier::DeviceSet
    end

    assert_pattern do
      response => {
        id: String,
        created_at: String,
        device_ids: ^(Courier::Internal::Type::ArrayOf[String]),
        name: String,
        updated_at: String,
        archived_at: String | nil
      }
    end
  end

  def test_create_device_set_required_params
    skip("Mock server tests are disabled")

    response =
      @courier.previews.create_device_set(device_ids: ["pvd_1w6dgafr3aaycvv9a8bm996pkc"], name: "Mobile")

    assert_pattern do
      response => Courier::DeviceSet
    end

    assert_pattern do
      response => {
        id: String,
        created_at: String,
        device_ids: ^(Courier::Internal::Type::ArrayOf[String]),
        name: String,
        updated_at: String,
        archived_at: String | nil
      }
    end
  end

  def test_list_device_sets
    skip("Mock server tests are disabled")

    response = @courier.previews.list_device_sets

    assert_pattern do
      response => Courier::DeviceSetListResponse
    end

    assert_pattern do
      response => {
        results: ^(Courier::Internal::Type::ArrayOf[Courier::DeviceSet])
      }
    end
  end

  def test_list_devices
    skip("Mock server tests are disabled")

    response = @courier.previews.list_devices

    assert_pattern do
      response => Courier::PreviewDeviceListResponse
    end

    assert_pattern do
      response => {
        results: ^(Courier::Internal::Type::ArrayOf[Courier::PreviewDevice])
      }
    end
  end

  def test_retrieve_device_set
    skip("Mock server tests are disabled")

    response = @courier.previews.retrieve_device_set("deviceSetId")

    assert_pattern do
      response => Courier::DeviceSet
    end

    assert_pattern do
      response => {
        id: String,
        created_at: String,
        device_ids: ^(Courier::Internal::Type::ArrayOf[String]),
        name: String,
        updated_at: String,
        archived_at: String | nil
      }
    end
  end

  def test_update_device_set_required_params
    skip("Mock server tests are disabled")

    response =
      @courier.previews.update_device_set(
        "deviceSetId",
        device_ids: %w[pvd_1w6dgafr3aaycvv9a8bm996pkc pvd_34qvmj6p4dbqaa5mpys1ekt9jx],
        name: "Mobile and desktop"
      )

    assert_pattern do
      response => Courier::DeviceSet
    end

    assert_pattern do
      response => {
        id: String,
        created_at: String,
        device_ids: ^(Courier::Internal::Type::ArrayOf[String]),
        name: String,
        updated_at: String,
        archived_at: String | nil
      }
    end
  end
end
