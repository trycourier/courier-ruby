# typed: strong

module Trycourier
  module Models
    class SubscriptionTopicNew < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::SubscriptionTopicNew, Trycourier::Internal::AnyHash)
        end

      sig { returns(Trycourier::SubscriptionTopicNew::Status::OrSymbol) }
      attr_accessor :status

      # The default channels to send to this tenant when has_custom_routing is enabled
      sig do
        returns(
          T.nilable(T::Array[Trycourier::ChannelClassification::OrSymbol])
        )
      end
      attr_accessor :custom_routing

      # Override channel routing with custom preferences. This will override any
      # template preferences that are set, but a user can still customize their
      # preferences
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :has_custom_routing

      sig do
        params(
          status: Trycourier::SubscriptionTopicNew::Status::OrSymbol,
          custom_routing:
            T.nilable(T::Array[Trycourier::ChannelClassification::OrSymbol]),
          has_custom_routing: T.nilable(T::Boolean)
        ).returns(T.attached_class)
      end
      def self.new(
        status:,
        # The default channels to send to this tenant when has_custom_routing is enabled
        custom_routing: nil,
        # Override channel routing with custom preferences. This will override any
        # template preferences that are set, but a user can still customize their
        # preferences
        has_custom_routing: nil
      )
      end

      sig do
        override.returns(
          {
            status: Trycourier::SubscriptionTopicNew::Status::OrSymbol,
            custom_routing:
              T.nilable(T::Array[Trycourier::ChannelClassification::OrSymbol]),
            has_custom_routing: T.nilable(T::Boolean)
          }
        )
      end
      def to_hash
      end

      module Status
        extend Trycourier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Trycourier::SubscriptionTopicNew::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        OPTED_OUT =
          T.let(
            :OPTED_OUT,
            Trycourier::SubscriptionTopicNew::Status::TaggedSymbol
          )
        OPTED_IN =
          T.let(
            :OPTED_IN,
            Trycourier::SubscriptionTopicNew::Status::TaggedSymbol
          )
        REQUIRED =
          T.let(
            :REQUIRED,
            Trycourier::SubscriptionTopicNew::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Trycourier::SubscriptionTopicNew::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
