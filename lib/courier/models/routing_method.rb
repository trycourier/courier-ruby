# frozen_string_literal: true

module Courier
  module Models
    module RoutingMethod
      extend Courier::Internal::Type::Enum

      ALL = :all
      SINGLE = :single

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
