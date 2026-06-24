# typed: strong

module Courier
  module Models
    class PreferenceSectionGetResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::PreferenceSectionGetResponse,
            Courier::Internal::AnyHash
          )
        end

      # The preference section id.
      sig { returns(String) }
      attr_accessor :id

      # ISO-8601 timestamp of when the section was created.
      sig { returns(String) }
      attr_accessor :created

      # Whether the section defines custom routing for its topics.
      sig { returns(T::Boolean) }
      attr_accessor :has_custom_routing

      # Human-readable name.
      sig { returns(String) }
      attr_accessor :name

      # Default channels for the section. May be empty.
      sig { returns(T::Array[Courier::ChannelClassification::TaggedSymbol]) }
      attr_accessor :routing_options

      # The topics contained in this section.
      sig { returns(T::Array[Courier::PreferenceTopicGetResponse]) }
      attr_accessor :topics

      # Id of the creator.
      sig { returns(T.nilable(String)) }
      attr_accessor :creator

      # ISO-8601 timestamp of the last update.
      sig { returns(T.nilable(String)) }
      attr_accessor :updated

      # Id of the last updater.
      sig { returns(T.nilable(String)) }
      attr_accessor :updater

      # A preference section in your workspace, including its topics.
      sig do
        params(
          id: String,
          created: String,
          has_custom_routing: T::Boolean,
          name: String,
          routing_options: T::Array[Courier::ChannelClassification::OrSymbol],
          topics: T::Array[Courier::PreferenceTopicGetResponse::OrHash],
          creator: T.nilable(String),
          updated: T.nilable(String),
          updater: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # The preference section id.
        id:,
        # ISO-8601 timestamp of when the section was created.
        created:,
        # Whether the section defines custom routing for its topics.
        has_custom_routing:,
        # Human-readable name.
        name:,
        # Default channels for the section. May be empty.
        routing_options:,
        # The topics contained in this section.
        topics:,
        # Id of the creator.
        creator: nil,
        # ISO-8601 timestamp of the last update.
        updated: nil,
        # Id of the last updater.
        updater: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            created: String,
            has_custom_routing: T::Boolean,
            name: String,
            routing_options:
              T::Array[Courier::ChannelClassification::TaggedSymbol],
            topics: T::Array[Courier::PreferenceTopicGetResponse],
            creator: T.nilable(String),
            updated: T.nilable(String),
            updater: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
