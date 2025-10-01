# typed: strong

module Courier
  module Models
    class AuthIssueTokenParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Courier::AuthIssueTokenParams, Courier::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :expires_in

      sig { returns(Courier::AuthIssueTokenParams::Scope::OrSymbol) }
      attr_accessor :scope

      sig do
        params(
          expires_in: String,
          scope: Courier::AuthIssueTokenParams::Scope::OrSymbol,
          request_options: Courier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(expires_in:, scope:, request_options: {})
      end

      sig do
        override.returns(
          {
            expires_in: String,
            scope: Courier::AuthIssueTokenParams::Scope::OrSymbol,
            request_options: Courier::RequestOptions
          }
        )
      end
      def to_hash
      end

      module Scope
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Courier::AuthIssueTokenParams::Scope) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        READ_PREFERENCES =
          T.let(
            :"read:preferences",
            Courier::AuthIssueTokenParams::Scope::TaggedSymbol
          )
        WRITE_PREFERENCES =
          T.let(
            :"write:preferences",
            Courier::AuthIssueTokenParams::Scope::TaggedSymbol
          )
        READ_USER_TOKENS =
          T.let(
            :"read:user-tokens",
            Courier::AuthIssueTokenParams::Scope::TaggedSymbol
          )
        WRITE_USER_TOKENS =
          T.let(
            :"write:user-tokens",
            Courier::AuthIssueTokenParams::Scope::TaggedSymbol
          )
        READ_BRANDS =
          T.let(
            :"read:brands",
            Courier::AuthIssueTokenParams::Scope::TaggedSymbol
          )
        WRITE_BRANDS =
          T.let(
            :"write:brands",
            Courier::AuthIssueTokenParams::Scope::TaggedSymbol
          )
        READ_BRANDS_ID =
          T.let(
            :"read:brands{:id}",
            Courier::AuthIssueTokenParams::Scope::TaggedSymbol
          )
        WRITE_BRANDS_ID =
          T.let(
            :"write:brands{:id}",
            Courier::AuthIssueTokenParams::Scope::TaggedSymbol
          )
        WRITE_TRACK =
          T.let(
            :"write:track",
            Courier::AuthIssueTokenParams::Scope::TaggedSymbol
          )
        INBOX_READ_MESSAGES =
          T.let(
            :"inbox:read:messages",
            Courier::AuthIssueTokenParams::Scope::TaggedSymbol
          )
        INBOX_WRITE_MESSAGES =
          T.let(
            :"inbox:write:messages",
            Courier::AuthIssueTokenParams::Scope::TaggedSymbol
          )
        INBOX_WRITE_EVENT =
          T.let(
            :"inbox:write:event",
            Courier::AuthIssueTokenParams::Scope::TaggedSymbol
          )
        INBOX_WRITE_EVENTS =
          T.let(
            :"inbox:write:events",
            Courier::AuthIssueTokenParams::Scope::TaggedSymbol
          )
        USER_ID_YOUR_USER_ID =
          T.let(
            :"user_id:$YOUR_USER_ID",
            Courier::AuthIssueTokenParams::Scope::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Courier::AuthIssueTokenParams::Scope::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
