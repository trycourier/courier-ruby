# typed: strong

module Courier
  module Resources
    # Render a template's email content on real email clients and read back the
    # screenshots, so you can check how it looks before you send it.
    class Previews
      # Archive a device set. This is a soft delete — the archived set is returned and
      # no longer appears in list results. Runs already created against it keep their
      # own copy of the device list and are unaffected. The Courier-provided default set
      # cannot be archived and returns 409.
      sig do
        params(
          device_set_id: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::DeviceSet)
      end
      def archive_device_set(
        # The preview set to archive.
        device_set_id,
        request_options: {}
      )
      end

      # Create a named, reusable set of preview devices. Every id must be one listed by
      # `GET /previews/devices`; any other is a 422.
      sig do
        params(
          device_ids: T::Array[String],
          name: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::DeviceSet)
      end
      def create_device_set(
        # The devices the set contains, by `PreviewDevice.id`. At least one is required.
        device_ids:,
        # Human-readable name.
        name:,
        request_options: {}
      )
      end

      # List the workspace's preview sets. Archived sets are not returned.
      sig do
        params(request_options: Courier::RequestOptions::OrHash).returns(
          Courier::DeviceSetListResponse
        )
      end
      def list_device_sets(request_options: {})
      end

      # List the devices a preview can be rendered on. Reference data, identical for
      # every workspace — these ids are what a device set is built from and what a run
      # reports results for.
      sig do
        params(request_options: Courier::RequestOptions::OrHash).returns(
          Courier::PreviewDeviceListResponse
        )
      end
      def list_devices(request_options: {})
      end

      # Retrieve a preview set by ID. Archived sets return 404.
      sig do
        params(
          device_set_id: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::DeviceSet)
      end
      def retrieve_device_set(
        # The preview set to retrieve, identified by the `id` returned when it was
        # created.
        device_set_id,
        request_options: {}
      )
      end

      # Replace a device set. This is a full replace, not a patch — both the name and
      # the device list are always written. The Courier-provided default set cannot be
      # changed and returns 409.
      sig do
        params(
          device_set_id: String,
          device_ids: T::Array[String],
          name: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::DeviceSet)
      end
      def update_device_set(
        # The preview set to replace.
        device_set_id,
        # The devices the set contains, by `PreviewDevice.id`. At least one is required.
        device_ids:,
        # Human-readable name.
        name:,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Courier::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
