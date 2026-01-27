# frozen_string_literal: true

module Courier
  module Resources
    class Auth
      # Some parameter documentations has been truncated, see
      # {Courier::Models::AuthIssueTokenParams} for more details.
      #
      # Returns a new access token.
      #
      # @overload issue_token(expires_in:, scope:, request_options: {})
      #
      # @param expires_in [String] Duration for token expiration. Accepts various time formats:
      #
      # @param scope [String] Available scopes:
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::AuthIssueTokenResponse]
      #
      # @see Courier::Models::AuthIssueTokenParams
      def issue_token(params)
        parsed, options = Courier::AuthIssueTokenParams.dump_request(params)
        @client.request(
          method: :post,
          path: "auth/issue-token",
          body: parsed,
          model: Courier::Models::AuthIssueTokenResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [Courier::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
