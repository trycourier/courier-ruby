# typed: strong

module Trycourier
  module Models
    class Preference < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::Preference, Trycourier::Internal::AnyHash)
        end

      sig { returns(Trycourier::PreferenceStatus::OrSymbol) }
      attr_accessor :status

      sig { returns(T.nilable(T::Array[Trycourier::ChannelPreference])) }
      attr_accessor :channel_preferences

      sig { returns(T.nilable(T::Array[Trycourier::Rule])) }
      attr_accessor :rules

      sig { returns(T.nilable(Trycourier::Preference::Source::OrSymbol)) }
      attr_accessor :source

      sig do
        params(
          status: Trycourier::PreferenceStatus::OrSymbol,
          channel_preferences:
            T.nilable(T::Array[Trycourier::ChannelPreference::OrHash]),
          rules: T.nilable(T::Array[Trycourier::Rule::OrHash]),
          source: T.nilable(Trycourier::Preference::Source::OrSymbol)
        ).returns(T.attached_class)
      end
      def self.new(status:, channel_preferences: nil, rules: nil, source: nil)
      end

      sig do
        override.returns(
          {
            status: Trycourier::PreferenceStatus::OrSymbol,
            channel_preferences:
              T.nilable(T::Array[Trycourier::ChannelPreference]),
            rules: T.nilable(T::Array[Trycourier::Rule]),
            source: T.nilable(Trycourier::Preference::Source::OrSymbol)
          }
        )
      end
      def to_hash
      end

      module Source
        extend Trycourier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Trycourier::Preference::Source) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        SUBSCRIPTION =
          T.let(:subscription, Trycourier::Preference::Source::TaggedSymbol)
        LIST = T.let(:list, Trycourier::Preference::Source::TaggedSymbol)
        RECIPIENT =
          T.let(:recipient, Trycourier::Preference::Source::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Trycourier::Preference::Source::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
