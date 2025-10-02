# frozen_string_literal: true

module Courier
  module Models
    class BrandColors < Courier::Internal::Type::BaseModel
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
  end
end
