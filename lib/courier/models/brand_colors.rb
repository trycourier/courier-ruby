# frozen_string_literal: true

module Courier
  module Models
    class BrandColors < Courier::Internal::Type::BaseModel
      # @!attribute primary
      #
      #   @return [String, nil]
      optional :primary, String

      # @!attribute secondary
      #
      #   @return [String, nil]
      optional :secondary, String

      # @!method initialize(primary: nil, secondary: nil)
      #   @param primary [String]
      #   @param secondary [String]
    end
  end
end
