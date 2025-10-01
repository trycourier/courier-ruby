# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Auth#issue_token
    class AuthIssueTokenParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute expires_in
      #
      #   @return [String]
      required :expires_in, String

      # @!attribute scope
      #
      #   @return [Symbol, Courier::Models::AuthIssueTokenParams::Scope]
      required :scope, enum: -> { Courier::AuthIssueTokenParams::Scope }

      # @!method initialize(expires_in:, scope:, request_options: {})
      #   @param expires_in [String]
      #   @param scope [Symbol, Courier::Models::AuthIssueTokenParams::Scope]
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]

      module Scope
        extend Courier::Internal::Type::Enum

        READ_PREFERENCES = :"read:preferences"
        WRITE_PREFERENCES = :"write:preferences"
        READ_USER_TOKENS = :"read:user-tokens"
        WRITE_USER_TOKENS = :"write:user-tokens"
        READ_BRANDS = :"read:brands"
        WRITE_BRANDS = :"write:brands"
        READ_BRANDS_ID = :"read:brands{:id}"
        WRITE_BRANDS_ID = :"write:brands{:id}"
        WRITE_TRACK = :"write:track"
        INBOX_READ_MESSAGES = :"inbox:read:messages"
        INBOX_WRITE_MESSAGES = :"inbox:write:messages"
        INBOX_WRITE_EVENT = :"inbox:write:event"
        INBOX_WRITE_EVENTS = :"inbox:write:events"
        USER_ID_YOUR_USER_ID = :"user_id:$YOUR_USER_ID"

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
