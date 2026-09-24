# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Previews#archive_device_set
    class DeviceSet < Courier::Internal::Type::BaseModel
      # @!attribute id
      #   Unique identifier for the device set.
      #
      #   @return [String]
      required :id, String

      # @!attribute created_at
      #   ISO-8601 timestamp of when the set was created.
      #
      #   @return [String]
      required :created_at, String

      # @!attribute device_ids
      #   The devices in this set, by `PreviewDevice.id`.
      #
      #   @return [Array<String>]
      required :device_ids, Courier::Internal::Type::ArrayOf[String]

      # @!attribute name
      #   Human-readable name.
      #
      #   @return [String]
      required :name, String

      # @!attribute updated_at
      #   ISO-8601 timestamp of when the set was last written.
      #
      #   @return [String]
      required :updated_at, String

      # @!attribute archived_at
      #   ISO-8601 timestamp of when the set was archived. Present only on the archive
      #   response, which is the one place the state is observable.
      #
      #   @return [String, nil]
      optional :archived_at, String

      # @!method initialize(id:, created_at:, device_ids:, name:, updated_at:, archived_at: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::DeviceSet} for more details.
      #
      #   A named, reusable list of preview devices.
      #
      #   @param id [String] Unique identifier for the device set.
      #
      #   @param created_at [String] ISO-8601 timestamp of when the set was created.
      #
      #   @param device_ids [Array<String>] The devices in this set, by `PreviewDevice.id`.
      #
      #   @param name [String] Human-readable name.
      #
      #   @param updated_at [String] ISO-8601 timestamp of when the set was last written.
      #
      #   @param archived_at [String] ISO-8601 timestamp of when the set was archived. Present only on the archive res
    end
  end
end
