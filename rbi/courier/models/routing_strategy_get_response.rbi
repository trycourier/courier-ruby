# typed: strong

module Courier
  module Models
    class RoutingStrategyGetResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::RoutingStrategyGetResponse, Courier::Internal::AnyHash)
        end

      # The routing strategy ID (rs\_ prefix).
      sig { returns(String) }
      attr_accessor :id

      # Per-channel delivery configuration. May be empty.
      sig { returns(T::Hash[Symbol, Courier::Channel]) }
      attr_accessor :channels

      # Epoch milliseconds when the strategy was created.
      sig { returns(Integer) }
      attr_accessor :created

      # User ID of the creator.
      sig { returns(String) }
      attr_accessor :creator

      # Human-readable name.
      sig { returns(String) }
      attr_accessor :name

      # Per-provider delivery configuration. May be empty.
      sig { returns(T::Hash[Symbol, Courier::MessageProvidersType]) }
      attr_accessor :providers

      # Routing tree defining channel selection method and order.
      sig { returns(Courier::MessageRouting) }
      attr_reader :routing

      sig { params(routing: Courier::MessageRouting::OrHash).void }
      attr_writer :routing

      # Description of the routing strategy.
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # Tags for categorization.
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :tags

      # Epoch milliseconds of last update.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :updated

      # User ID of the last updater.
      sig { returns(T.nilable(String)) }
      attr_accessor :updater

      # Full routing strategy entity returned by GET.
      sig do
        params(
          id: String,
          channels: T::Hash[Symbol, Courier::Channel::OrHash],
          created: Integer,
          creator: String,
          name: String,
          providers: T::Hash[Symbol, Courier::MessageProvidersType::OrHash],
          routing: Courier::MessageRouting::OrHash,
          description: T.nilable(String),
          tags: T.nilable(T::Array[String]),
          updated: T.nilable(Integer),
          updater: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # The routing strategy ID (rs\_ prefix).
        id:,
        # Per-channel delivery configuration. May be empty.
        channels:,
        # Epoch milliseconds when the strategy was created.
        created:,
        # User ID of the creator.
        creator:,
        # Human-readable name.
        name:,
        # Per-provider delivery configuration. May be empty.
        providers:,
        # Routing tree defining channel selection method and order.
        routing:,
        # Description of the routing strategy.
        description: nil,
        # Tags for categorization.
        tags: nil,
        # Epoch milliseconds of last update.
        updated: nil,
        # User ID of the last updater.
        updater: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            channels: T::Hash[Symbol, Courier::Channel],
            created: Integer,
            creator: String,
            name: String,
            providers: T::Hash[Symbol, Courier::MessageProvidersType],
            routing: Courier::MessageRouting,
            description: T.nilable(String),
            tags: T.nilable(T::Array[String]),
            updated: T.nilable(Integer),
            updater: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
