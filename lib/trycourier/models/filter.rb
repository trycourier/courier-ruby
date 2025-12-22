# frozen_string_literal: true

module Trycourier
  module Models
    # A single filter to use for filtering
    module Filter
      extend Trycourier::Internal::Type::Union

      # A single filter to use for filtering
      variant -> { Trycourier::SingleFilterConfig }

      # The operator to use for filtering
      variant -> { Trycourier::NestedFilterConfig }

      # @!method self.variants
      #   @return [Array(Trycourier::Models::SingleFilterConfig, Trycourier::Models::NestedFilterConfig)]
    end
  end
end
