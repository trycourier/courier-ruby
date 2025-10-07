# frozen_string_literal: true

module Courier
  module Models
    module Tenants
      module Alignment
        extend Courier::Internal::Type::Enum

        CENTER = :center
        LEFT = :left
        RIGHT = :right
        FULL = :full

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
