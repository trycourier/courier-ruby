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
      #   @return [Courier::Models::Email, nil]
      optional :email, -> { Courier::Email }, nil?: true

      # @!attribute inapp
      #
      #   @return [Object, nil]
      optional :inapp, Courier::Internal::Type::Unknown

      # @!method initialize(colors: nil, email: nil, inapp: nil)
      #   @param colors [Courier::Models::BrandColors, nil]
      #   @param email [Courier::Models::Email, nil]
      #   @param inapp [Object]
    end
  end
end
