# frozen_string_literal: true

module Trycourier
  module Models
    module WebhookAuthMode
      extend Trycourier::Internal::Type::Enum

      NONE = :none
      BASIC = :basic
      BEARER = :bearer

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
