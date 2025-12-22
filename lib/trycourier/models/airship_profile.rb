# frozen_string_literal: true

module Trycourier
  module Models
    class AirshipProfile < Trycourier::Internal::Type::BaseModel
      # @!attribute audience
      #
      #   @return [Trycourier::Models::AirshipProfileAudience]
      required :audience, -> { Trycourier::AirshipProfileAudience }

      # @!attribute device_types
      #
      #   @return [Array<String>]
      required :device_types, Trycourier::Internal::Type::ArrayOf[String]

      # @!method initialize(audience:, device_types:)
      #   @param audience [Trycourier::Models::AirshipProfileAudience]
      #   @param device_types [Array<String>]
    end
  end
end
