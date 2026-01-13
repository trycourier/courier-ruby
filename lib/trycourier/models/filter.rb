# frozen_string_literal: true

module Trycourier
  module Models
    class Filter < Trycourier::Internal::Type::BaseModel
      # @!attribute filters
      #
      #   @return [Array<Trycourier::Models::SingleFilterConfig, Trycourier::Models::NestedFilterConfig>]
      required :filters, -> { Trycourier::Internal::Type::ArrayOf[union: Trycourier::FilterConfig] }

      # @!method initialize(filters:)
      #   Filter that contains an array of FilterConfig items
      #
      #   @param filters [Array<Trycourier::Models::SingleFilterConfig, Trycourier::Models::NestedFilterConfig>]
    end
  end
end
