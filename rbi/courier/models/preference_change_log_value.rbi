# typed: strong

module Courier
  module Models
    class PreferenceChangeLogValue < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::PreferenceChangeLogValue, Courier::Internal::AnyHash)
        end

      # The channels chosen before the change.
      sig { returns(T::Array[Courier::ChannelClassification::TaggedSymbol]) }
      attr_accessor :custom_routing

      # Whether custom routing was in effect before the change.
      sig { returns(T::Boolean) }
      attr_accessor :has_custom_routing

      # The subscription status before the change.
      sig { returns(Courier::PreferenceStatus::TaggedSymbol) }
      attr_accessor :status

      sig do
        params(
          custom_routing: T::Array[Courier::ChannelClassification::OrSymbol],
          has_custom_routing: T::Boolean,
          status: Courier::PreferenceStatus::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The channels chosen before the change.
        custom_routing:,
        # Whether custom routing was in effect before the change.
        has_custom_routing:,
        # The subscription status before the change.
        status:
      )
      end

      sig do
        override.returns(
          {
            custom_routing:
              T::Array[Courier::ChannelClassification::TaggedSymbol],
            has_custom_routing: T::Boolean,
            status: Courier::PreferenceStatus::TaggedSymbol
          }
        )
      end
      def to_hash
      end
    end
  end
end
