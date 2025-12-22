# frozen_string_literal: true

module Trycourier
  module Models
    module WebhookMethod
      extend Trycourier::Internal::Type::Enum

      POST = :POST
      PUT = :PUT

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
