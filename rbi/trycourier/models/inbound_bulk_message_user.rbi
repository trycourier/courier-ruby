# typed: strong

module Trycourier
  module Models
    class InboundBulkMessageUser < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Trycourier::InboundBulkMessageUser,
            Trycourier::Internal::AnyHash
          )
        end

      # User-specific data that will be merged with message.data
      sig { returns(T.nilable(T.anything)) }
      attr_reader :data

      sig { params(data: T.anything).void }
      attr_writer :data

      sig { returns(T.nilable(Trycourier::RecipientPreferences)) }
      attr_reader :preferences

      sig do
        params(
          preferences: T.nilable(Trycourier::RecipientPreferences::OrHash)
        ).void
      end
      attr_writer :preferences

      # User profile information. For email-based bulk jobs, `profile.email` is required
      # for provider routing to determine if the message can be delivered. The email
      # address should be provided here rather than in `to.email`.
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_accessor :profile

      # User ID (legacy field, use profile or to.user_id instead)
      sig { returns(T.nilable(String)) }
      attr_accessor :recipient

      # Optional recipient information. Note: For email provider routing, use
      # `profile.email` instead of `to.email`. The `to` field is primarily used for
      # recipient identification and data merging.
      sig { returns(T.nilable(Trycourier::UserRecipient)) }
      attr_reader :to

      sig { params(to: T.nilable(Trycourier::UserRecipient::OrHash)).void }
      attr_writer :to

      sig do
        params(
          data: T.anything,
          preferences: T.nilable(Trycourier::RecipientPreferences::OrHash),
          profile: T.nilable(T::Hash[Symbol, T.anything]),
          recipient: T.nilable(String),
          to: T.nilable(Trycourier::UserRecipient::OrHash)
        ).returns(T.attached_class)
      end
      def self.new(
        # User-specific data that will be merged with message.data
        data: nil,
        preferences: nil,
        # User profile information. For email-based bulk jobs, `profile.email` is required
        # for provider routing to determine if the message can be delivered. The email
        # address should be provided here rather than in `to.email`.
        profile: nil,
        # User ID (legacy field, use profile or to.user_id instead)
        recipient: nil,
        # Optional recipient information. Note: For email provider routing, use
        # `profile.email` instead of `to.email`. The `to` field is primarily used for
        # recipient identification and data merging.
        to: nil
      )
      end

      sig do
        override.returns(
          {
            data: T.anything,
            preferences: T.nilable(Trycourier::RecipientPreferences),
            profile: T.nilable(T::Hash[Symbol, T.anything]),
            recipient: T.nilable(String),
            to: T.nilable(Trycourier::UserRecipient)
          }
        )
      end
      def to_hash
      end
    end
  end
end
