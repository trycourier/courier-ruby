# typed: strong

module Courier
  module Models
    class WorkspacePreferenceGetResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::WorkspacePreferenceGetResponse,
            Courier::Internal::AnyHash
          )
        end

      # The workspace preference id.
      sig { returns(String) }
      attr_accessor :id

      # ISO-8601 timestamp of when the workspace preference was created.
      sig { returns(String) }
      attr_accessor :created

      # Whether the workspace preference defines custom routing for its topics.
      sig { returns(T::Boolean) }
      attr_accessor :has_custom_routing

      # Human-readable name.
      sig { returns(String) }
      attr_accessor :name

      # Default channels for the workspace preference. May be empty.
      sig { returns(T::Array[Courier::ChannelClassification::TaggedSymbol]) }
      attr_accessor :routing_options

      # The topics contained in this workspace preference.
      sig { returns(T::Array[Courier::WorkspacePreferenceTopicGetResponse]) }
      attr_accessor :topics

      # Id of the creator.
      sig { returns(T.nilable(String)) }
      attr_accessor :creator

      # Optional description shown under the section on the hosted preferences page.
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # ISO-8601 timestamp of the last update.
      sig { returns(T.nilable(String)) }
      attr_accessor :updated

      # Id of the last updater.
      sig { returns(T.nilable(String)) }
      attr_accessor :updater

      # A workspace preference in your workspace, including its topics.
      sig do
        params(
          id: String,
          created: String,
          has_custom_routing: T::Boolean,
          name: String,
          routing_options: T::Array[Courier::ChannelClassification::OrSymbol],
          topics:
            T::Array[Courier::WorkspacePreferenceTopicGetResponse::OrHash],
          creator: T.nilable(String),
          description: T.nilable(String),
          updated: T.nilable(String),
          updater: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # The workspace preference id.
        id:,
        # ISO-8601 timestamp of when the workspace preference was created.
        created:,
        # Whether the workspace preference defines custom routing for its topics.
        has_custom_routing:,
        # Human-readable name.
        name:,
        # Default channels for the workspace preference. May be empty.
        routing_options:,
        # The topics contained in this workspace preference.
        topics:,
        # Id of the creator.
        creator: nil,
        # Optional description shown under the section on the hosted preferences page.
        description: nil,
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
            topics: T::Array[Courier::WorkspacePreferenceTopicGetResponse],
            creator: T.nilable(String),
            description: T.nilable(String),
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
