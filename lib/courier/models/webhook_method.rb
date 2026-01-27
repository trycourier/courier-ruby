# frozen_string_literal: true

module Courier
  module Models
    module WebhookMethod
      extend Courier::Internal::Type::Enum

      POST = :POST
      PUT = :PUT

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
