# frozen_string_literal: true

module Trycourier
  module Models
    module Users
      # @see Trycourier::Resources::Users::Tokens#list
      class TokenListResponse < Trycourier::Internal::Type::BaseModel
        # @!attribute tokens
        #
        #   @return [Array<Trycourier::Models::Users::UserToken>]
        required :tokens, -> { Trycourier::Internal::Type::ArrayOf[Trycourier::Users::UserToken] }

        # @!method initialize(tokens:)
        #   A list of tokens registered with the user.
        #
        #   @param tokens [Array<Trycourier::Models::Users::UserToken>]
      end
    end
  end
end
