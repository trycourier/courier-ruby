# frozen_string_literal: true

module Trycourier
  module Models
    # @see Trycourier::Resources::Auth#issue_token
    class AuthIssueTokenParams < Trycourier::Internal::Type::BaseModel
      extend Trycourier::Internal::Type::RequestParameters::Converter
      include Trycourier::Internal::Type::RequestParameters

      # @!attribute expires_in
      #   Duration for token expiration. Accepts various time formats: - "2 hours" - 2
      #   hours from now - "1d" - 1 day - "10h" - 10 hours - "2.5 hrs" - 2.5 hours -
      #   "1m" - 1 minute - "5s" - 5 seconds - "1y" - 1 year
      #
      #   @return [String]
      required :expires_in, String

      # @!attribute scope
      #   Space-separated list of scopes that define what the token can access. Common
      #   scopes include: Inbox Auth: - user_id:<user-id> - Access to a specific user
      #   (multiple can be listed) - read:messages - Read messages (requires user_id
      #   scope) - inbox:read:messages - Read inbox messages - inbox:write:events - Write
      #   inbox events (mark as read, etc.) Preferences Auth: - read:preferences - Read
      #   user preferences - write:preferences - Write user preferences Brands Auth: -
      #   read:brands[:<brand_id>] - Read brands (optionally specific brand) -
      #   write:brands[:<brand_id>] - Write brands (optionally specific brand) Example:
      #   "user_id:user123 inbox:read:messages inbox:write:events"
      #
      #   @return [String]
      required :scope, String

      # @!method initialize(expires_in:, scope:, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Trycourier::Models::AuthIssueTokenParams} for more details.
      #
      #   @param expires_in [String] Duration for token expiration. Accepts various time formats: - "2 hours" - 2 hou
      #
      #   @param scope [String] Space-separated list of scopes that define what the token can access. Common sco
      #
      #   @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
