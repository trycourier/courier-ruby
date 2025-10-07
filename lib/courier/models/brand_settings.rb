# frozen_string_literal: true

module Courier
  module Models
    class BrandSettings < Courier::Internal::Type::BaseModel
      # @!attribute colors
      #
      #   @return [Courier::Models::BrandColors, nil]
      optional :colors, -> { Courier::BrandColors }, nil?: true

      # @!attribute email
      #
      #   @return [Courier::Models::BrandSettingsEmail, nil]
      optional :email, -> { Courier::BrandSettingsEmail }, nil?: true

      # @!attribute inapp
      #
      #   @return [Courier::Models::BrandSettingsInApp, nil]
      optional :inapp, -> { Courier::BrandSettingsInApp }, nil?: true

      # @!method initialize(colors: nil, email: nil, inapp: nil)
      #   @param colors [Courier::Models::BrandColors, nil]
      #   @param email [Courier::Models::BrandSettingsEmail, nil]
      #   @param inapp [Courier::Models::BrandSettingsInApp, nil]
    end
  end
end
