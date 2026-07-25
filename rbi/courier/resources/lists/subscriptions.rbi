# typed: strong

module Courier
  module Resources
    class Lists
      class Subscriptions
        # Returns the users subscribed to a list with paging, each with the preferences
        # recorded for that subscription.
        sig do
          params(
            list_id: String,
            cursor: T.nilable(String),
            request_options: Courier::RequestOptions::OrHash
          ).returns(Courier::Models::Lists::SubscriptionListResponse)
        end
        def list(
          # A unique identifier representing the list you wish to retrieve.
          list_id,
          # A unique identifier that allows for fetching the next set of list subscriptions
          cursor: nil,
          request_options: {}
        )
        end

        # Subscribes additional users to the list, without modifying existing
        # subscriptions. If the list does not exist, it will be automatically created.
        sig do
          params(
            list_id: String,
            recipients: T::Array[Courier::PutSubscriptionsRecipient::OrHash],
            request_options: Courier::RequestOptions::OrHash
          ).void
        end
        def add(
          # A unique identifier representing the list you wish to retrieve.
          list_id,
          recipients:,
          request_options: {}
        )
        end

        # Subscribes the users to the list, overwriting existing subscriptions. If the
        # list does not exist, it will be automatically created.
        sig do
          params(
            list_id: String,
            recipients: T::Array[Courier::PutSubscriptionsRecipient::OrHash],
            request_options: Courier::RequestOptions::OrHash
          ).void
        end
        def subscribe(
          # A unique identifier representing the list you wish to retrieve.
          list_id,
          recipients:,
          request_options: {}
        )
        end

        # Subscribes one user to a list, creating the list if it does not yet exist.
        # Optional preferences apply to this subscription only.
        sig do
          params(
            user_id: String,
            list_id: String,
            preferences: T.nilable(Courier::RecipientPreferences::OrHash),
            request_options: Courier::RequestOptions::OrHash
          ).void
        end
        def subscribe_user(
          # Path param: A unique identifier representing the recipient associated with the
          # list
          user_id,
          # Path param: A unique identifier representing the list you wish to retrieve.
          list_id:,
          # Body param
          preferences: nil,
          request_options: {}
        )
        end

        # Removes one user's subscription to a list, addressed by list id and user id. The
        # user's profile and other subscriptions are separate resources.
        sig do
          params(
            user_id: String,
            list_id: String,
            request_options: Courier::RequestOptions::OrHash
          ).void
        end
        def unsubscribe_user(
          # A unique identifier representing the recipient associated with the list
          user_id,
          # A unique identifier representing the list you wish to retrieve.
          list_id:,
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
