# frozen_string_literal: true

module Trycourier
  module Models
    class BrandColors < Trycourier::Internal::Type::BaseModel
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
