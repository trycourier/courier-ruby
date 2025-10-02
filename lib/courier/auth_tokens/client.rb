# frozen_string_literal: true

module Courier
  module AuthTokens
    class Client
      # @return [Courier::AuthTokens::Client]
      def initialize(client:)
        @client = client
      end

      # Returns a new access token.
      #
      # @return [Courier::AuthTokens::Types::IssueTokenResponse]
      def issue_token(request_options: {}, **params)
        _request = Courier::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Courier::Environment::PRODUCTION,
          method: "POST",
          path: "/auth/issue-token",
          body: params
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Courier::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Courier::AuthTokens::Types::IssueTokenResponse.load(_response.body)
        else
          error_class = Courier::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end
    end
  end
end
