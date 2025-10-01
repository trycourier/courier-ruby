# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Auth#issue_token
    class AuthIssueTokenResponse < Courier::Internal::Type::BaseModel
      # @!attribute token
      #
      #   @return [String, nil]
      optional :token, String, nil?: true

      # @!method initialize(token: nil)
      #   @param token [String, nil]
    end
  end
end
