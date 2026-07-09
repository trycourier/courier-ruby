# typed: strong

module Courier
  module Models
    class WorkspacePreferenceTopicGetResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::WorkspacePreferenceTopicGetResponse,
            Courier::Internal::AnyHash
          )
        end

      # The preference topic id.
      sig { returns(String) }
      attr_accessor :id

      # Preference controls a recipient may customize. May be empty.
      sig do
        returns(
          T::Array[
            Courier::WorkspacePreferenceTopicGetResponse::AllowedPreference::TaggedSymbol
          ]
        )
      end
      attr_accessor :allowed_preferences

      # ISO-8601 timestamp of when the topic was created.
      sig { returns(String) }
      attr_accessor :created

      # The default subscription status applied when a recipient has not set their own.
      sig do
        returns(
          Courier::WorkspacePreferenceTopicGetResponse::DefaultStatus::TaggedSymbol
        )
      end
      attr_accessor :default_status

      # Whether a list-unsubscribe header is included on emails for this topic.
      sig { returns(T::Boolean) }
      attr_accessor :include_unsubscribe_header

      # Human-readable name.
      sig { returns(String) }
      attr_accessor :name

      # Default channels delivered for this topic. May be empty.
      sig { returns(T::Array[Courier::ChannelClassification::TaggedSymbol]) }
      attr_accessor :routing_options

      # Arbitrary metadata associated with the topic.
      sig { returns(T::Hash[Symbol, T.anything]) }
      attr_accessor :topic_data

      # ISO-8601 timestamp of the last update.
      sig { returns(String) }
      attr_accessor :updated

      # Id of the creator.
      sig { returns(T.nilable(String)) }
      attr_accessor :creator

      # Optional description shown under the topic on the hosted preferences page.
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # Id of the last updater.
      sig { returns(T.nilable(String)) }
      attr_accessor :updater

      # A subscription preference topic in your workspace.
      sig do
        params(
          id: String,
          allowed_preferences:
            T::Array[
              Courier::WorkspacePreferenceTopicGetResponse::AllowedPreference::OrSymbol
            ],
          created: String,
          default_status:
            Courier::WorkspacePreferenceTopicGetResponse::DefaultStatus::OrSymbol,
          include_unsubscribe_header: T::Boolean,
          name: String,
          routing_options: T::Array[Courier::ChannelClassification::OrSymbol],
          topic_data: T::Hash[Symbol, T.anything],
          updated: String,
          creator: T.nilable(String),
          description: T.nilable(String),
          updater: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # The preference topic id.
        id:,
        # Preference controls a recipient may customize. May be empty.
        allowed_preferences:,
        # ISO-8601 timestamp of when the topic was created.
        created:,
        # The default subscription status applied when a recipient has not set their own.
        default_status:,
        # Whether a list-unsubscribe header is included on emails for this topic.
        include_unsubscribe_header:,
        # Human-readable name.
        name:,
        # Default channels delivered for this topic. May be empty.
        routing_options:,
        # Arbitrary metadata associated with the topic.
        topic_data:,
        # ISO-8601 timestamp of the last update.
        updated:,
        # Id of the creator.
        creator: nil,
        # Optional description shown under the topic on the hosted preferences page.
        description: nil,
        # Id of the last updater.
        updater: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            allowed_preferences:
              T::Array[
                Courier::WorkspacePreferenceTopicGetResponse::AllowedPreference::TaggedSymbol
              ],
            created: String,
            default_status:
              Courier::WorkspacePreferenceTopicGetResponse::DefaultStatus::TaggedSymbol,
            include_unsubscribe_header: T::Boolean,
            name: String,
            routing_options:
              T::Array[Courier::ChannelClassification::TaggedSymbol],
            topic_data: T::Hash[Symbol, T.anything],
            updated: String,
            creator: T.nilable(String),
            description: T.nilable(String),
            updater: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      # A preference control a recipient may customize for a topic.
      module AllowedPreference
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              Courier::WorkspacePreferenceTopicGetResponse::AllowedPreference
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        SNOOZE =
          T.let(
            :snooze,
            Courier::WorkspacePreferenceTopicGetResponse::AllowedPreference::TaggedSymbol
          )
        CHANNEL_PREFERENCES =
          T.let(
            :channel_preferences,
            Courier::WorkspacePreferenceTopicGetResponse::AllowedPreference::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Courier::WorkspacePreferenceTopicGetResponse::AllowedPreference::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      # The default subscription status applied when a recipient has not set their own.
      module DefaultStatus
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              Courier::WorkspacePreferenceTopicGetResponse::DefaultStatus
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        OPTED_OUT =
          T.let(
            :OPTED_OUT,
            Courier::WorkspacePreferenceTopicGetResponse::DefaultStatus::TaggedSymbol
          )
        OPTED_IN =
          T.let(
            :OPTED_IN,
            Courier::WorkspacePreferenceTopicGetResponse::DefaultStatus::TaggedSymbol
          )
        REQUIRED =
          T.let(
            :REQUIRED,
            Courier::WorkspacePreferenceTopicGetResponse::DefaultStatus::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Courier::WorkspacePreferenceTopicGetResponse::DefaultStatus::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
