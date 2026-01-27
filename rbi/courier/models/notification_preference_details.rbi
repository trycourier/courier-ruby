# typed: strong

module Courier
  module Models
    class NotificationPreferenceDetails < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::NotificationPreferenceDetails,
            Courier::Internal::AnyHash
          )
        end

      sig { returns(Courier::PreferenceStatus::OrSymbol) }
      attr_accessor :status

      sig { returns(T.nilable(T::Array[Courier::ChannelPreference])) }
      attr_accessor :channel_preferences

      sig { returns(T.nilable(T::Array[Courier::Rule])) }
      attr_accessor :rules

      sig do
        params(
          status: Courier::PreferenceStatus::OrSymbol,
          channel_preferences:
            T.nilable(T::Array[Courier::ChannelPreference::OrHash]),
          rules: T.nilable(T::Array[Courier::Rule::OrHash])
        ).returns(T.attached_class)
      end
      def self.new(status:, channel_preferences: nil, rules: nil)
      end

      sig do
        override.returns(
          {
            status: Courier::PreferenceStatus::OrSymbol,
            channel_preferences:
              T.nilable(T::Array[Courier::ChannelPreference]),
            rules: T.nilable(T::Array[Courier::Rule])
          }
        )
      end
      def to_hash
      end
    end
  end
end
