# frozen_string_literal: true

module Trycourier
  module Models
    module Users
      # @see Trycourier::Resources::Users::Tokens#retrieve
      class TokenRetrieveResponse < Trycourier::Models::UserToken
        # @!attribute status
        #
        #   @return [Symbol, Trycourier::Models::Users::TokenRetrieveResponse::Status, nil]
        optional :status, enum: -> { Trycourier::Models::Users::TokenRetrieveResponse::Status }, nil?: true

        # @!attribute status_reason
        #   The reason for the token status.
        #
        #   @return [String, nil]
        optional :status_reason, String, nil?: true

        # @!method initialize(status: nil, status_reason: nil)
        #   @param status [Symbol, Trycourier::Models::Users::TokenRetrieveResponse::Status, nil]
        #
        #   @param status_reason [String, nil] The reason for the token status.

        module Status
          extend Trycourier::Internal::Type::Enum

          ACTIVE = :active
          UNKNOWN = :unknown
          FAILED = :failed
          REVOKED = :revoked

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
