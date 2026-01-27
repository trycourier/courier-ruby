# frozen_string_literal: true

module Courier
  module Models
    module Users
      # @see Courier::Resources::Users::Tokens#list
      class TokenListResponse < Courier::Internal::Type::BaseModel
        # @!attribute tokens
        #
        #   @return [Array<Courier::Models::Users::UserToken>]
        required :tokens, -> { Courier::Internal::Type::ArrayOf[Courier::Users::UserToken] }

        # @!method initialize(tokens:)
        #   A list of tokens registered with the user.
        #
        #   @param tokens [Array<Courier::Models::Users::UserToken>]
      end
    end
  end
end
