# frozen_string_literal: true

module Courier
  module Models
    module JourneyState
      extend Courier::Internal::Type::Enum

      DRAFT = :DRAFT
      PUBLISHED = :PUBLISHED

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
