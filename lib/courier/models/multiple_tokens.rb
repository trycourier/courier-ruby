# frozen_string_literal: true

module Courier
  module Models
    class MultipleTokens < Courier::Internal::Type::BaseModel
      # @!attribute tokens
      #
      #   @return [Array<Courier::Models::Token>]
      required :tokens, -> { Courier::Internal::Type::ArrayOf[Courier::Token] }

      # @!method initialize(tokens:)
      #   @param tokens [Array<Courier::Models::Token>]
    end
  end
end
