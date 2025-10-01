# typed: strong

module Courier
  module Models
    class ProfileRetrieveResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::Models::ProfileRetrieveResponse,
            Courier::Internal::AnyHash
          )
        end

      sig { returns(T::Hash[Symbol, T.anything]) }
      attr_accessor :profile

      sig { returns(T.nilable(Courier::Lists::RecipientPreferences)) }
      attr_reader :preferences

      sig do
        params(
          preferences: T.nilable(Courier::Lists::RecipientPreferences::OrHash)
        ).void
      end
      attr_writer :preferences

      sig do
        params(
          profile: T::Hash[Symbol, T.anything],
          preferences: T.nilable(Courier::Lists::RecipientPreferences::OrHash)
        ).returns(T.attached_class)
      end
      def self.new(profile:, preferences: nil)
      end

      sig do
        override.returns(
          {
            profile: T::Hash[Symbol, T.anything],
            preferences: T.nilable(Courier::Lists::RecipientPreferences)
          }
        )
      end
      def to_hash
      end
    end
  end
end
