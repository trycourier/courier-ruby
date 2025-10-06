# typed: strong

module Courier
  module Models
    class Preference < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Courier::Preference, Courier::Internal::AnyHash) }

      sig { returns(Courier::Users::PreferenceStatus::OrSymbol) }
      attr_accessor :status

      sig { returns(T.nilable(T::Array[Courier::ChannelPreference])) }
      attr_accessor :channel_preferences

      sig { returns(T.nilable(T::Array[Courier::Rule])) }
      attr_accessor :rules

      sig { returns(T.nilable(Courier::Preference::Source::OrSymbol)) }
      attr_accessor :source

      sig do
        params(
          status: Courier::Users::PreferenceStatus::OrSymbol,
          channel_preferences:
            T.nilable(T::Array[Courier::ChannelPreference::OrHash]),
          rules: T.nilable(T::Array[Courier::Rule::OrHash]),
          source: T.nilable(Courier::Preference::Source::OrSymbol)
        ).returns(T.attached_class)
      end
      def self.new(status:, channel_preferences: nil, rules: nil, source: nil)
      end

      sig do
        override.returns(
          {
            status: Courier::Users::PreferenceStatus::OrSymbol,
            channel_preferences:
              T.nilable(T::Array[Courier::ChannelPreference]),
            rules: T.nilable(T::Array[Courier::Rule]),
            source: T.nilable(Courier::Preference::Source::OrSymbol)
          }
        )
      end
      def to_hash
      end

      module Source
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Courier::Preference::Source) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        SUBSCRIPTION =
          T.let(:subscription, Courier::Preference::Source::TaggedSymbol)
        LIST = T.let(:list, Courier::Preference::Source::TaggedSymbol)
        RECIPIENT = T.let(:recipient, Courier::Preference::Source::TaggedSymbol)

        sig do
          override.returns(T::Array[Courier::Preference::Source::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
