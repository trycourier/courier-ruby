# frozen_string_literal: true

module Trycourier
  module Models
    module TextStyle
      extend Trycourier::Internal::Type::Enum

      TEXT = :text
      H1 = :h1
      H2 = :h2
      SUBTEXT = :subtext

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
