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

      sig { returns(T.nilable(T.anything)) }
      attr_reader :profile

      sig { params(profile: T.anything).void }
      attr_writer :profile

      sig { returns(T.nilable(String)) }
      attr_accessor :recipient

      sig { returns(T.nilable(Trycourier::UserRecipient)) }
      attr_reader :to

      sig { params(to: T.nilable(Trycourier::UserRecipient::OrHash)).void }
      attr_writer :to

      sig do
        params(
          data: T.anything,
          preferences: T.nilable(Trycourier::RecipientPreferences::OrHash),
          profile: T.anything,
          recipient: T.nilable(String),
          to: T.nilable(Trycourier::UserRecipient::OrHash)
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
            preferences: T.nilable(Trycourier::RecipientPreferences),
            profile: T.anything,
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
