# typed: strong

module Courier
  module Models
    class InboundBulkMessageUser < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::InboundBulkMessageUser, Courier::Internal::AnyHash)
        end

      sig { returns(T.nilable(T.anything)) }
      attr_reader :data

      sig { params(data: T.anything).void }
      attr_writer :data

      sig { returns(T.nilable(Courier::RecipientPreferences)) }
      attr_reader :preferences

      sig do
        params(
          preferences: T.nilable(Courier::RecipientPreferences::OrHash)
        ).void
      end
      attr_writer :preferences

      sig { returns(T.nilable(T.anything)) }
      attr_reader :profile

      sig { params(profile: T.anything).void }
      attr_writer :profile

      sig { returns(T.nilable(String)) }
      attr_accessor :recipient

      sig { returns(T.nilable(Courier::UserRecipient)) }
      attr_reader :to

      sig { params(to: T.nilable(Courier::UserRecipient::OrHash)).void }
      attr_writer :to

      sig do
        params(
          data: T.anything,
          preferences: T.nilable(Courier::RecipientPreferences::OrHash),
          profile: T.anything,
          recipient: T.nilable(String),
          to: T.nilable(Courier::UserRecipient::OrHash)
        ).returns(T.attached_class)
      end
      def self.new(
        data: nil,
        preferences: nil,
        profile: nil,
        recipient: nil,
        to: nil
      )
      end

      sig do
        override.returns(
          {
            data: T.anything,
            preferences: T.nilable(Courier::RecipientPreferences),
            profile: T.anything,
            recipient: T.nilable(String),
            to: T.nilable(Courier::UserRecipient)
          }
        )
      end
      def to_hash
      end
    end
  end
end
