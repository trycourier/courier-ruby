# typed: strong

module Trycourier
  module Resources
    class Users
      class Preferences
        # Fetch all user preferences.
        sig do
          params(
            user_id: String,
            tenant_id: T.nilable(String),
            request_options: Trycourier::RequestOptions::OrHash
          ).returns(Trycourier::Models::Users::PreferenceRetrieveResponse)
        end
        def retrieve(
          # A unique identifier associated with the user whose preferences you wish to
          # retrieve.
          user_id,
          # Query the preferences of a user for this specific tenant context.
          tenant_id: nil,
          request_options: {}
        )
        end

        # Fetch user preferences for a specific subscription topic.
        sig do
          params(
            topic_id: String,
            user_id: String,
            tenant_id: T.nilable(String),
            request_options: Trycourier::RequestOptions::OrHash
          ).returns(Trycourier::Models::Users::PreferenceRetrieveTopicResponse)
        end
        def retrieve_topic(
          # Path param: A unique identifier associated with a subscription topic.
          topic_id,
          # Path param: A unique identifier associated with the user whose preferences you
          # wish to retrieve.
          user_id:,
          # Query param: Query the preferences of a user for this specific tenant context.
          tenant_id: nil,
          request_options: {}
        )
        end

        # Update or Create user preferences for a specific subscription topic.
        sig do
          params(
            topic_id: String,
            user_id: String,
            topic:
              Trycourier::Users::PreferenceUpdateOrCreateTopicParams::Topic::OrHash,
            tenant_id: T.nilable(String),
            request_options: Trycourier::RequestOptions::OrHash
          ).returns(
            Trycourier::Models::Users::PreferenceUpdateOrCreateTopicResponse
          )
        end
        def update_or_create_topic(
          # Path param: A unique identifier associated with a subscription topic.
          topic_id,
          # Path param: A unique identifier associated with the user whose preferences you
          # wish to retrieve.
          user_id:,
          # Body param
          topic:,
          # Query param: Update the preferences of a user for this specific tenant context.
          tenant_id: nil,
          request_options: {}
        )
        end

        # @api private
        sig { params(client: Trycourier::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
