# frozen_string_literal: true

module Courier
  module Models
    # Apple Push Notification device tokens. Supply either a single `token` or a
    # `tokens` value. A bare string is rejected by the provider — the token must be
    # wrapped in this object.
    module Apn
      extend Courier::Internal::Type::Union

      variant -> { Courier::Token }

      variant -> { Courier::MultipleTokens }

      # @!method self.variants
      #   @return [Array(Courier::Models::Token, Courier::Models::MultipleTokens)]
    end
  end
end
