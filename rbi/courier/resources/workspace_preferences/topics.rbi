# typed: strong

module Courier
  module Resources
    class WorkspacePreferences
      class Topics
        # Create a subscription preference topic inside a workspace preference. Fails with
        # 404 if the workspace preference does not exist. The topic id is generated and
        # returned.
        sig do
          params(
            section_id: String,
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
            topic_data: T.nilable(T::Hash[Symbol, T.anything]),
            request_options: Courier::RequestOptions::OrHash
          ).returns(Courier::WorkspacePreferenceTopicGetResponse)
        end
        def create(
          # Id of the workspace preference to create the topic in.
          section_id,
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
          topic_data: nil,
          request_options: {}
        )
        end

        # Retrieve a topic within a workspace preference. Returns 404 if the workspace
        # preference does not exist, the topic does not exist, or the topic belongs to a
        # different workspace preference.
        sig do
          params(
            topic_id: String,
            section_id: String,
            request_options: Courier::RequestOptions::OrHash
          ).returns(Courier::WorkspacePreferenceTopicGetResponse)
        end
        def retrieve(
          # Id of the subscription preference topic.
          topic_id,
          # Id of the workspace preference.
          section_id:,
          request_options: {}
        )
        end

        # List the topics in a workspace preference.
        sig do
          params(
            section_id: String,
            request_options: Courier::RequestOptions::OrHash
          ).returns(Courier::WorkspacePreferenceTopicListResponse)
        end
        def list(
          # Id of the workspace preference.
          section_id,
          request_options: {}
        )
        end

        # Archive a topic and remove it from its workspace preference. Same 404 rules as
        # GET.
        sig do
          params(
            topic_id: String,
            section_id: String,
            request_options: Courier::RequestOptions::OrHash
          ).void
        end
        def archive(
          # Id of the subscription preference topic.
          topic_id,
          # Id of the workspace preference.
          section_id:,
          request_options: {}
        )
        end

        # Replace a topic within a workspace preference. Full document replacement;
        # missing optional fields are cleared. Same 404 rules as GET.
        sig do
          params(
            topic_id: String,
            section_id: String,
            default_status:
              Courier::WorkspacePreferenceTopicReplaceRequest::DefaultStatus::OrSymbol,
            name: String,
            allowed_preferences:
              T.nilable(
                T::Array[
                  Courier::WorkspacePreferenceTopicReplaceRequest::AllowedPreference::OrSymbol
                ]
              ),
            include_unsubscribe_header: T.nilable(T::Boolean),
            routing_options:
              T.nilable(T::Array[Courier::ChannelClassification::OrSymbol]),
            topic_data: T.nilable(T::Hash[Symbol, T.anything]),
            request_options: Courier::RequestOptions::OrHash
          ).returns(Courier::WorkspacePreferenceTopicGetResponse)
        end
        def replace(
          # Path param: Id of the subscription preference topic.
          topic_id,
          # Path param: Id of the workspace preference.
          section_id:,
          # Body param: The default subscription status applied when a recipient has not set
          # their own.
          default_status:,
          # Body param: Human-readable name for the preference topic.
          name:,
          # Body param: Preference controls a recipient may customize. Omit to clear.
          allowed_preferences: nil,
          # Body param: Whether to include a list-unsubscribe header on emails for this
          # topic.
          include_unsubscribe_header: nil,
          # Body param: Default channels delivered for this topic. Omit to clear.
          routing_options: nil,
          # Body param: Arbitrary metadata associated with the topic. Omit to clear.
          topic_data: nil,
          request_options: {}
        )
        end

        # @api private
        sig { params(client: Courier::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
