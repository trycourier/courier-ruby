# typed: strong

module Courier
  module Resources
    class Profiles
      class Lists
        # Returns the lists a user is subscribed to, with paging. Use it to check what a
        # recipient will receive before sending to a list.
        sig do
          params(
            user_id: String,
            cursor: T.nilable(String),
            request_options: Courier::RequestOptions::OrHash
          ).returns(Courier::Models::Profiles::ListRetrieveResponse)
        end
        def retrieve(
          # A unique identifier representing the user associated with the requested user
          # profile.
          user_id,
          # A unique identifier that allows for fetching the next set of message statuses.
          cursor: nil,
          request_options: {}
        )
        end

        # Removes every list subscription for a user at once. Their profile and
        # preferences are untouched, so this only affects list-targeted sends.
        sig do
          params(
            user_id: String,
            request_options: Courier::RequestOptions::OrHash
          ).returns(Courier::Models::Profiles::ListDeleteResponse)
        end
        def delete(
          # A unique identifier representing the user associated with the requested profile.
          user_id,
          request_options: {}
        )
        end

        # Subscribes a user to one or more lists, creating any list that does not yet
        # exist. Optional preferences apply to each subscription.
        sig do
          params(
            user_id: String,
            lists: T::Array[Courier::SubscribeToListsRequestItem::OrHash],
            idempotency_key: String,
            x_idempotency_expiration: String,
            request_options: Courier::RequestOptions::OrHash
          ).returns(Courier::Models::Profiles::ListSubscribeResponse)
        end
        def subscribe(
          # Path param: A unique identifier representing the user associated with the
          # requested user profile.
          user_id,
          # Body param
          lists:,
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

        # @api private
        sig { params(client: Courier::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
