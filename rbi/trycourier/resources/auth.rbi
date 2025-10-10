# typed: strong

module Trycourier
  module Resources
    class Auth
      # Returns a new access token.
      sig do
        params(
          expires_in: String,
          scope: String,
          request_options: Trycourier::RequestOptions::OrHash
        ).returns(Trycourier::Models::AuthIssueTokenResponse)
      end
      def issue_token(expires_in:, scope:, request_options: {})
      end

      # @api private
      sig { params(client: Trycourier::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
