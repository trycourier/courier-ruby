# frozen_string_literal: true

module Courier
  module Models
    class MultipleTokens < Courier::Internal::Type::BaseModel
      # @!attribute tokens
      #   One device token, or an array of them. The values are the token strings
      #   themselves — not objects.
      #
      #   @return [String, Array<String>]
      required :tokens, union: -> { Courier::MultipleTokens::Tokens }

      # @!method initialize(tokens:)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::MultipleTokens} for more details.
      #
      #   @param tokens [String, Array<String>] One device token, or an array of them. The values are the token strings themselv

      # One device token, or an array of them. The values are the token strings
      # themselves — not objects.
      #
      # @see Courier::Models::MultipleTokens#tokens
      module Tokens
        extend Courier::Internal::Type::Union

        variant String

        variant -> { Courier::Models::MultipleTokens::Tokens::StringArray }

        # @!method self.variants
        #   @return [Array(String, Array<String>)]

        # @type [Courier::Internal::Type::Converter]
        StringArray = Courier::Internal::Type::ArrayOf[String]
      end
    end
  end
end
