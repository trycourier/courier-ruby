# typed: strong

module Courier
  module Resources
    class Auth
      # Returns a new access token.
      sig do
        params(
          expires_in: String,
          scope: Courier::AuthIssueTokenParams::Scope::OrSymbol,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::Models::AuthIssueTokenResponse)
      end
      def issue_token(expires_in:, scope:, request_options: {})
      end

      # @api private
      sig { params(client: Courier::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
