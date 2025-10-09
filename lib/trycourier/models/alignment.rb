# frozen_string_literal: true

module Trycourier
  module Models
    module Alignment
      extend Trycourier::Internal::Type::Enum

      CENTER = :center
      LEFT = :left
      RIGHT = :right
      FULL = :full

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
