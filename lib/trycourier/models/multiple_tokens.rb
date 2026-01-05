# frozen_string_literal: true

module Trycourier
  module Models
    class MultipleTokens < Trycourier::Internal::Type::BaseModel
      # @!attribute tokens
      #
      #   @return [Array<Trycourier::Models::Token>]
      required :tokens, -> { Trycourier::Internal::Type::ArrayOf[Trycourier::Token] }

      # @!method initialize(tokens:)
      #   @param tokens [Array<Trycourier::Models::Token>]
    end
  end
end
