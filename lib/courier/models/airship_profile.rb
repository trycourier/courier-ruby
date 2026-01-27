# frozen_string_literal: true

module Courier
  module Models
    class AirshipProfile < Courier::Internal::Type::BaseModel
      # @!attribute audience
      #
      #   @return [Courier::Models::AirshipProfileAudience]
      required :audience, -> { Courier::AirshipProfileAudience }

      # @!attribute device_types
      #
      #   @return [Array<String>]
      required :device_types, Courier::Internal::Type::ArrayOf[String]

      # @!method initialize(audience:, device_types:)
      #   @param audience [Courier::Models::AirshipProfileAudience]
      #   @param device_types [Array<String>]
    end
  end
end
