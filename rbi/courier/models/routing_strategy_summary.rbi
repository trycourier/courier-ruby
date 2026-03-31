# typed: strong

module Courier
  module Models
    class RoutingStrategySummary < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::RoutingStrategySummary, Courier::Internal::AnyHash)
        end

      # The routing strategy ID (rs\_ prefix).
      sig { returns(String) }
      attr_accessor :id

      # Epoch milliseconds when the strategy was created.
      sig { returns(Integer) }
      attr_accessor :created

      # User ID of the creator.
      sig { returns(String) }
      attr_accessor :creator

      # Human-readable name.
      sig { returns(String) }
      attr_accessor :name

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

      # Routing strategy metadata returned in list responses. Does not include
      # routing/channels/providers content.
      sig do
        params(
          id: String,
          created: Integer,
          creator: String,
          name: String,
          description: T.nilable(String),
          tags: T.nilable(T::Array[String]),
          updated: T.nilable(Integer),
          updater: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # The routing strategy ID (rs\_ prefix).
        id:,
        # Epoch milliseconds when the strategy was created.
        created:,
        # User ID of the creator.
        creator:,
        # Human-readable name.
        name:,
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
            created: Integer,
            creator: String,
            name: String,
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
