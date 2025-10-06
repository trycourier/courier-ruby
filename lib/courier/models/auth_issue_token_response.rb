# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Auth#issue_token
    class AuthIssueTokenResponse < Courier::Internal::Type::BaseModel
      # @!attribute token
      #
      #   @return [String]
      required :token, String

      # @!method initialize(token:)
      #   @param token [String]
    end
  end
end
