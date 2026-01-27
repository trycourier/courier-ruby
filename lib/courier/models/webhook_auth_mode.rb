# frozen_string_literal: true

module Courier
  module Models
    module WebhookAuthMode
      extend Courier::Internal::Type::Enum

      NONE = :none
      BASIC = :basic
      BEARER = :bearer

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
