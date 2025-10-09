# frozen_string_literal: true

module Trycourier
  module Models
    class BrandColors < Trycourier::Internal::Type::BaseModel
      # @!attribute primary
      #
      #   @return [String, nil]
      optional :primary, String, nil?: true

      # @!attribute secondary
      #
      #   @return [String, nil]
      optional :secondary, String, nil?: true

      # @!method initialize(primary: nil, secondary: nil)
      #   @param primary [String, nil]
      #   @param secondary [String, nil]
    end
  end
end
