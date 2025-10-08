# frozen_string_literal: true

module Courier
  module Models
    module Users
      # @see Courier::Resources::Users::Tokens#retrieve
      class TokenRetrieveResponse < Courier::Models::UserToken
        # @!attribute status
        #
        #   @return [Symbol, Courier::Models::Users::TokenRetrieveResponse::Status, nil]
        optional :status, enum: -> { Courier::Models::Users::TokenRetrieveResponse::Status }, nil?: true

        # @!attribute status_reason
        #   The reason for the token status.
        #
        #   @return [String, nil]
        optional :status_reason, String, nil?: true

        # @!method initialize(status: nil, status_reason: nil)
        #   @param status [Symbol, Courier::Models::Users::TokenRetrieveResponse::Status, nil]
        #
        #   @param status_reason [String, nil] The reason for the token status.

        module Status
          extend Courier::Internal::Type::Enum

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
