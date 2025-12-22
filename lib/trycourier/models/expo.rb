# frozen_string_literal: true

module Trycourier
  module Models
    module Expo
      extend Trycourier::Internal::Type::Union

      variant -> { Trycourier::Token }

      variant -> { Trycourier::MultipleTokens }

      # @!method self.variants
      #   @return [Array(Trycourier::Models::Token, Trycourier::Models::MultipleTokens)]
    end
  end
end
