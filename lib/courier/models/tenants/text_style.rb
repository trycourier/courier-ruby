# frozen_string_literal: true

module Courier
  module Models
    module Tenants
      module TextStyle
        extend Courier::Internal::Type::Enum

        TEXT = :text
        H1 = :h1
        H2 = :h2
        SUBTEXT = :subtext

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
