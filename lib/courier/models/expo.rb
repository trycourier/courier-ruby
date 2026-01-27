# frozen_string_literal: true

module Courier
  module Models
    module Expo
      extend Courier::Internal::Type::Union

      variant -> { Courier::Token }

      variant -> { Courier::MultipleTokens }

      # @!method self.variants
      #   @return [Array(Courier::Models::Token, Courier::Models::MultipleTokens)]
    end
  end
end
