# typed: strong

module Courier
  module Models
    class RoutingStrategyReplaceRequest < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::RoutingStrategyReplaceRequest,
            Courier::Internal::AnyHash
          )
        end

      # Human-readable name for the routing strategy.
      sig { returns(String) }
      attr_accessor :name

      # Routing tree defining channel selection method and order.
      sig { returns(Courier::MessageRouting) }
      attr_reader :routing

      sig { params(routing: Courier::MessageRouting::OrHash).void }
      attr_writer :routing

      # Per-channel delivery configuration. Omit to clear.
      sig { returns(T.nilable(T::Hash[Symbol, Courier::Channel])) }
      attr_accessor :channels

      # Optional description. Omit or null to clear.
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # Per-provider delivery configuration. Omit to clear.
      sig { returns(T.nilable(T::Hash[Symbol, Courier::MessageProvidersType])) }
      attr_accessor :providers

      # Optional tags. Omit or null to clear.
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :tags

      # Request body for replacing a routing strategy. Full document replacement;
      # missing optional fields are cleared.
      sig do
        params(
          name: String,
          routing: Courier::MessageRouting::OrHash,
          channels: T.nilable(T::Hash[Symbol, Courier::Channel::OrHash]),
          description: T.nilable(String),
          providers:
            T.nilable(T::Hash[Symbol, Courier::MessageProvidersType::OrHash]),
          tags: T.nilable(T::Array[String])
        ).returns(T.attached_class)
      end
      def self.new(
        # Human-readable name for the routing strategy.
        name:,
        # Routing tree defining channel selection method and order.
        routing:,
        # Per-channel delivery configuration. Omit to clear.
        channels: nil,
        # Optional description. Omit or null to clear.
        description: nil,
        # Per-provider delivery configuration. Omit to clear.
        providers: nil,
        # Optional tags. Omit or null to clear.
        tags: nil
      )
      end

      sig do
        override.returns(
          {
            name: String,
            routing: Courier::MessageRouting,
            channels: T.nilable(T::Hash[Symbol, Courier::Channel]),
            description: T.nilable(String),
            providers:
              T.nilable(T::Hash[Symbol, Courier::MessageProvidersType]),
            tags: T.nilable(T::Array[String])
          }
        )
      end
      def to_hash
      end
    end
  end
end
