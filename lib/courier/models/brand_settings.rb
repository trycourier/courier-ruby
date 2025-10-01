# frozen_string_literal: true

module Courier
  module Models
    class BrandSettings < Courier::Internal::Type::BaseModel
      # @!attribute colors
      #
      #   @return [Courier::Models::BrandSettings::Colors, nil]
      optional :colors, -> { Courier::BrandSettings::Colors }, nil?: true

      # @!attribute email
      #
      #   @return [Courier::Models::BrandSettings::Email, nil]
      optional :email, -> { Courier::BrandSettings::Email }, nil?: true

      # @!attribute inapp
      #
      #   @return [Object, nil]
      optional :inapp, Courier::Internal::Type::Unknown

      # @!method initialize(colors: nil, email: nil, inapp: nil)
      #   @param colors [Courier::Models::BrandSettings::Colors, nil]
      #   @param email [Courier::Models::BrandSettings::Email, nil]
      #   @param inapp [Object]

      # @see Courier::Models::BrandSettings#colors
      class Colors < Courier::Internal::Type::BaseModel
        # @!attribute primary
        #
        #   @return [String, nil]
        optional :primary, String, nil?: true

        # @!attribute secondary
        #
        #   @return [String, nil]
        optional :secondary, String, nil?: true

        # @!attribute tertiary
        #
        #   @return [String, nil]
        optional :tertiary, String, nil?: true

        # @!method initialize(primary: nil, secondary: nil, tertiary: nil)
        #   @param primary [String, nil]
        #   @param secondary [String, nil]
        #   @param tertiary [String, nil]
      end

      # @see Courier::Models::BrandSettings#email
      class Email < Courier::Internal::Type::BaseModel
        # @!attribute footer
        #
        #   @return [Object]
        required :footer, Courier::Internal::Type::Unknown

        # @!attribute header
        #
        #   @return [Object]
        required :header, Courier::Internal::Type::Unknown

        # @!method initialize(footer:, header:)
        #   @param footer [Object]
        #   @param header [Object]
      end
    end
  end
end
