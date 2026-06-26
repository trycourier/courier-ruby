# typed: strong

module Courier
  module Models
    class WorkspacePreferenceTopicCreateRequest < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::WorkspacePreferenceTopicCreateRequest,
            Courier::Internal::AnyHash
          )
        end

      # The default subscription status applied when a recipient has not set their own.
      sig do
        returns(
          Courier::WorkspacePreferenceTopicCreateRequest::DefaultStatus::OrSymbol
        )
      end
      attr_accessor :default_status

      # Human-readable name for the preference topic.
      sig { returns(String) }
      attr_accessor :name

      # Preference controls a recipient may customize for this topic. Defaults to empty
      # if omitted.
      sig do
        returns(
          T.nilable(
            T::Array[
              Courier::WorkspacePreferenceTopicCreateRequest::AllowedPreference::OrSymbol
            ]
          )
        )
      end
      attr_accessor :allowed_preferences

      # Whether to include a list-unsubscribe header on emails for this topic.
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :include_unsubscribe_header

      # Default channels delivered for this topic. Defaults to empty if omitted.
      sig do
        returns(T.nilable(T::Array[Courier::ChannelClassification::OrSymbol]))
      end
      attr_accessor :routing_options

      # Arbitrary metadata associated with the topic.
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_accessor :topic_data

      # Request body for creating a preference topic.
      sig do
        params(
          default_status:
            Courier::WorkspacePreferenceTopicCreateRequest::DefaultStatus::OrSymbol,
          name: String,
          allowed_preferences:
            T.nilable(
              T::Array[
                Courier::WorkspacePreferenceTopicCreateRequest::AllowedPreference::OrSymbol
              ]
            ),
          include_unsubscribe_header: T.nilable(T::Boolean),
          routing_options:
            T.nilable(T::Array[Courier::ChannelClassification::OrSymbol]),
          topic_data: T.nilable(T::Hash[Symbol, T.anything])
        ).returns(T.attached_class)
      end
      def self.new(
        # The default subscription status applied when a recipient has not set their own.
        default_status:,
        # Human-readable name for the preference topic.
        name:,
        # Preference controls a recipient may customize for this topic. Defaults to empty
        # if omitted.
        allowed_preferences: nil,
        # Whether to include a list-unsubscribe header on emails for this topic.
        include_unsubscribe_header: nil,
        # Default channels delivered for this topic. Defaults to empty if omitted.
        routing_options: nil,
        # Arbitrary metadata associated with the topic.
        topic_data: nil
      )
      end

      sig do
        override.returns(
          {
            default_status:
              Courier::WorkspacePreferenceTopicCreateRequest::DefaultStatus::OrSymbol,
            name: String,
            allowed_preferences:
              T.nilable(
                T::Array[
                  Courier::WorkspacePreferenceTopicCreateRequest::AllowedPreference::OrSymbol
                ]
              ),
            include_unsubscribe_header: T.nilable(T::Boolean),
            routing_options:
              T.nilable(T::Array[Courier::ChannelClassification::OrSymbol]),
            topic_data: T.nilable(T::Hash[Symbol, T.anything])
          }
        )
      end
      def to_hash
      end

      # The default subscription status applied when a recipient has not set their own.
      module DefaultStatus
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              Courier::WorkspacePreferenceTopicCreateRequest::DefaultStatus
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        OPTED_OUT =
          T.let(
            :OPTED_OUT,
            Courier::WorkspacePreferenceTopicCreateRequest::DefaultStatus::TaggedSymbol
          )
        OPTED_IN =
          T.let(
            :OPTED_IN,
            Courier::WorkspacePreferenceTopicCreateRequest::DefaultStatus::TaggedSymbol
          )
        REQUIRED =
          T.let(
            :REQUIRED,
            Courier::WorkspacePreferenceTopicCreateRequest::DefaultStatus::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Courier::WorkspacePreferenceTopicCreateRequest::DefaultStatus::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      # A preference control a recipient may customize for a topic.
      module AllowedPreference
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              Courier::WorkspacePreferenceTopicCreateRequest::AllowedPreference
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        SNOOZE =
          T.let(
            :snooze,
            Courier::WorkspacePreferenceTopicCreateRequest::AllowedPreference::TaggedSymbol
          )
        CHANNEL_PREFERENCES =
          T.let(
            :channel_preferences,
            Courier::WorkspacePreferenceTopicCreateRequest::AllowedPreference::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Courier::WorkspacePreferenceTopicCreateRequest::AllowedPreference::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
