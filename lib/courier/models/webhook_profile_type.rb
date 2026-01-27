# frozen_string_literal: true

module Courier
  module Models
    module WebhookProfileType
      extend Courier::Internal::Type::Enum

      LIMITED = :limited
      EXPANDED = :expanded

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
