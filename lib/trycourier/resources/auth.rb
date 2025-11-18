# frozen_string_literal: true

module Trycourier
  module Resources
    class Auth
      # Some parameter documentations has been truncated, see
      # {Trycourier::Models::AuthIssueTokenParams} for more details.
      #
      # Returns a new access token.
      #
      # @overload issue_token(expires_in:, scope:, request_options: {})
      #
      # @param expires_in [String] Duration for token expiration. Accepts various time formats:
      #
      # @param scope [String] Available scopes:
      #
      # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Trycourier::Models::AuthIssueTokenResponse]
      #
      # @see Trycourier::Models::AuthIssueTokenParams
      def issue_token(params)
        parsed, options = Trycourier::AuthIssueTokenParams.dump_request(params)
        @client.request(
          method: :post,
          path: "auth/issue-token",
          body: parsed,
          model: Trycourier::Models::AuthIssueTokenResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [Trycourier::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
