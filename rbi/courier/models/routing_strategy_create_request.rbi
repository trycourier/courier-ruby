# typed: strong

module Courier
  module Models
    class RoutingStrategyCreateRequest < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::RoutingStrategyCreateRequest,
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

      # Per-channel delivery configuration. Defaults to empty if omitted.
      sig { returns(T.nilable(T::Hash[Symbol, Courier::Channel])) }
      attr_accessor :channels

      # Optional description of the routing strategy.
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # Per-provider delivery configuration. Defaults to empty if omitted.
      sig { returns(T.nilable(T::Hash[Symbol, Courier::MessageProvidersType])) }
      attr_accessor :providers

      # Optional tags for categorization.
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :tags

      # Request body for creating a routing strategy.
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
        # Per-channel delivery configuration. Defaults to empty if omitted.
        channels: nil,
        # Optional description of the routing strategy.
        description: nil,
        # Per-provider delivery configuration. Defaults to empty if omitted.
        providers: nil,
        # Optional tags for categorization.
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
