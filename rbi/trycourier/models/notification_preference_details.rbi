# typed: strong

module Trycourier
  module Models
    class NotificationPreferenceDetails < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Trycourier::NotificationPreferenceDetails,
            Trycourier::Internal::AnyHash
          )
        end

      sig { returns(Trycourier::PreferenceStatus::OrSymbol) }
      attr_accessor :status

      sig { returns(T.nilable(T::Array[Trycourier::ChannelPreference])) }
      attr_accessor :channel_preferences

      sig { returns(T.nilable(T::Array[Trycourier::Rule])) }
      attr_accessor :rules

      sig do
        params(
          status: Trycourier::PreferenceStatus::OrSymbol,
          channel_preferences:
            T.nilable(T::Array[Trycourier::ChannelPreference::OrHash]),
          rules: T.nilable(T::Array[Trycourier::Rule::OrHash])
        ).returns(T.attached_class)
      end
      def self.new(status:, channel_preferences: nil, rules: nil)
      end

      sig do
        override.returns(
          {
            status: Trycourier::PreferenceStatus::OrSymbol,
            channel_preferences:
              T.nilable(T::Array[Trycourier::ChannelPreference]),
            rules: T.nilable(T::Array[Trycourier::Rule])
          }
        )
      end
      def to_hash
      end
    end
  end
end
