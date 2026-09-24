# frozen_string_literal: true

module Courier
  module Resources
    # Render a template's email content on real email clients and read back the
    # screenshots, so you can check how it looks before you send it.
    class Previews
      # Archive a device set. This is a soft delete — the archived set is returned and
      # no longer appears in list results. Runs already created against it keep their
      # own copy of the device list and are unaffected. The Courier-provided default set
      # cannot be archived and returns 409.
      #
      # @overload archive_device_set(device_set_id, request_options: {})
      #
      # @param device_set_id [String] The preview set to archive.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::DeviceSet]
      #
      # @see Courier::Models::PreviewArchiveDeviceSetParams
      def archive_device_set(device_set_id, params = {})
        @client.request(
          method: :delete,
          path: ["previews/device-sets/%1$s", device_set_id],
          model: Courier::DeviceSet,
          options: params[:request_options]
        )
      end

      # Create a named, reusable set of preview devices. Every id must be one listed by
      # `GET /previews/devices`; any other is a 422.
      #
      # @overload create_device_set(device_ids:, name:, request_options: {})
      #
      # @param device_ids [Array<String>] The devices the set contains, by `PreviewDevice.id`. At least one is required.
      #
      # @param name [String] Human-readable name.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::DeviceSet]
      #
      # @see Courier::Models::PreviewCreateDeviceSetParams
      def create_device_set(params)
        parsed, options = Courier::PreviewCreateDeviceSetParams.dump_request(params)
        @client.request(
          method: :post,
          path: "previews/device-sets",
          body: parsed,
          model: Courier::DeviceSet,
          options: options
        )
      end

      # List the workspace's preview sets. Archived sets are not returned.
      #
      # @overload list_device_sets(request_options: {})
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::DeviceSetListResponse]
      #
      # @see Courier::Models::PreviewListDeviceSetsParams
      def list_device_sets(params = {})
        @client.request(
          method: :get,
          path: "previews/device-sets",
          model: Courier::DeviceSetListResponse,
          options: params[:request_options]
        )
      end

      # List the devices a preview can be rendered on. Reference data, identical for
      # every workspace — these ids are what a device set is built from and what a run
      # reports results for.
      #
      # @overload list_devices(request_options: {})
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::PreviewDeviceListResponse]
      #
      # @see Courier::Models::PreviewListDevicesParams
      def list_devices(params = {})
        @client.request(
          method: :get,
          path: "previews/devices",
          model: Courier::PreviewDeviceListResponse,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Courier::Models::PreviewRetrieveDeviceSetParams} for more details.
      #
      # Retrieve a preview set by ID. Archived sets return 404.
      #
      # @overload retrieve_device_set(device_set_id, request_options: {})
      #
      # @param device_set_id [String] The preview set to retrieve, identified by the `id` returned when it was created
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::DeviceSet]
      #
      # @see Courier::Models::PreviewRetrieveDeviceSetParams
      def retrieve_device_set(device_set_id, params = {})
        @client.request(
          method: :get,
          path: ["previews/device-sets/%1$s", device_set_id],
          model: Courier::DeviceSet,
          options: params[:request_options]
        )
      end

      # Replace a device set. This is a full replace, not a patch — both the name and
      # the device list are always written. The Courier-provided default set cannot be
      # changed and returns 409.
      #
      # @overload update_device_set(device_set_id, device_ids:, name:, request_options: {})
      #
      # @param device_set_id [String] The preview set to replace.
      #
      # @param device_ids [Array<String>] The devices the set contains, by `PreviewDevice.id`. At least one is required.
      #
      # @param name [String] Human-readable name.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::DeviceSet]
      #
      # @see Courier::Models::PreviewUpdateDeviceSetParams
      def update_device_set(device_set_id, params)
        parsed, options = Courier::PreviewUpdateDeviceSetParams.dump_request(params)
        @client.request(
          method: :put,
          path: ["previews/device-sets/%1$s", device_set_id],
          body: parsed,
          model: Courier::DeviceSet,
          options: options
        )
      end

      # @api private
      #
      # @param client [Courier::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
