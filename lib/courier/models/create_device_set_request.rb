# frozen_string_literal: true

module Courier
  module Models
    class CreateDeviceSetRequest < Courier::Internal::Type::BaseModel
      # @!attribute device_ids
      #   The devices the set contains, by `PreviewDevice.id`. At least one is required.
      #
      #   @return [Array<String>]
      required :device_ids, Courier::Internal::Type::ArrayOf[String]

      # @!attribute name
      #   Human-readable name.
      #
      #   @return [String]
      required :name, String

      # @!method initialize(device_ids:, name:)
      #   Request body for creating or replacing a device set. A full replace, not a patch
      #   — both fields are always written.
      #
      #   @param device_ids [Array<String>] The devices the set contains, by `PreviewDevice.id`. At least one is required.
      #
      #   @param name [String] Human-readable name.
    end
  end
end
