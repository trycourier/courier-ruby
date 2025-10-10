# frozen_string_literal: true

module Trycourier
  module Models
    class BrandSettings < Trycourier::Internal::Type::BaseModel
      # @!attribute colors
      #
      #   @return [Trycourier::Models::BrandColors, nil]
      optional :colors, -> { Trycourier::BrandColors }, nil?: true

      # @!attribute email
      #
      #   @return [Trycourier::Models::BrandSettingsEmail, nil]
      optional :email, -> { Trycourier::BrandSettingsEmail }, nil?: true

      # @!attribute inapp
      #
      #   @return [Trycourier::Models::BrandSettingsInApp, nil]
      optional :inapp, -> { Trycourier::BrandSettingsInApp }, nil?: true

      # @!method initialize(colors: nil, email: nil, inapp: nil)
      #   @param colors [Trycourier::Models::BrandColors, nil]
      #   @param email [Trycourier::Models::BrandSettingsEmail, nil]
      #   @param inapp [Trycourier::Models::BrandSettingsInApp, nil]
    end
  end
end
