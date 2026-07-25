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
            request_options: Courier::RequestOptions::OrHash
          ).returns(Courier::Models::Profiles::ListSubscribeResponse)
        end
        def subscribe(
          # A unique identifier representing the user associated with the requested user
          # profile.
          user_id,
          lists:,
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
