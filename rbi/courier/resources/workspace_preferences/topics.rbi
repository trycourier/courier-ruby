# typed: strong

module Courier
  module Resources
    class WorkspacePreferences
      # Manage the workspace catalog of subscription topics, the sections that group
      # them, and publishing the preference page.
      class Topics
        # Creates a subscription topic inside a workspace preference. The default status
        # sets whether users start opted in, opted out, or required.
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
            description: T.nilable(String),
            include_unsubscribe_header: T.nilable(T::Boolean),
            routing_options:
              T.nilable(T::Array[Courier::ChannelClassification::OrSymbol]),
            topic_data: T.nilable(T::Hash[Symbol, T.anything]),
            idempotency_key: String,
            x_idempotency_expiration: String,
            request_options: Courier::RequestOptions::OrHash
          ).returns(Courier::WorkspacePreferenceTopicGetResponse)
        end
        def create(
          # Path param: Id of the workspace preference to create the topic in.
          section_id,
          # Body param: The default subscription status applied when a recipient has not set
          # their own.
          default_status:,
          # Body param: Human-readable name for the preference topic.
          name:,
          # Body param: Preference controls a recipient may customize for this topic.
          # Defaults to empty if omitted.
          allowed_preferences: nil,
          # Body param: Optional description shown under the topic on the hosted preferences
          # page.
          description: nil,
          # Body param: Whether to include a list-unsubscribe header on emails for this
          # topic.
          include_unsubscribe_header: nil,
          # Body param: Default channels delivered for this topic. Defaults to empty if
          # omitted.
          routing_options: nil,
          # Body param: Arbitrary metadata associated with the topic.
          topic_data: nil,
          # Header param: A unique key that makes this request idempotent. If Courier
          # receives another request with the same `Idempotency-Key`, it returns the stored
          # response from the first request without performing the operation again
          # (including the original status code and any error). Use it to safely retry
          # `POST` requests after network failures without risking duplicate sends. The key
          # is scoped to this endpoint.
          idempotency_key: nil,
          # Header param: How long the idempotency key remains valid, as a Unix epoch
          # timestamp in seconds or an ISO 8601 date string. Only applies when
          # `Idempotency-Key` is provided. If omitted, the key is retained for 25 hours; the
          # maximum is 1 year.
          x_idempotency_expiration: nil,
          request_options: {}
        )
        end

        # Returns one subscription topic with its default status, routing options, allowed
        # preferences, and unsubscribe header setting.
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

        # Returns the subscription topics inside a workspace preference, each with its
        # default status and routing options.
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

        # Archives a subscription topic and removes it from its workspace preference,
        # addressed by section id and topic id.
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
            description: T.nilable(String),
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
          # Body param: Optional description shown under the topic on the hosted preferences
          # page. Omit to clear.
          description: nil,
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
