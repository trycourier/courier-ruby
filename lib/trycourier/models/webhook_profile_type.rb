# frozen_string_literal: true

module Trycourier
  module Models
    module WebhookProfileType
      extend Trycourier::Internal::Type::Enum

      LIMITED = :limited
      EXPANDED = :expanded

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
