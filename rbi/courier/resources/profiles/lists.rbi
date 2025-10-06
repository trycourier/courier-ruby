# typed: strong

module Courier
  module Resources
    class Profiles
      class Lists
        # Returns the subscribed lists for a specified user.
        sig do
          params(
            user_id: String,
            cursor: T.nilable(String),
            request_options: Courier::RequestOptions::OrHash
          ).returns(Courier::Models::Profiles::ListRetrieveResponse)
        end
        def retrieve(
          # A unique identifier representing the user associated with the requested profile.
          user_id,
          # A unique identifier that allows for fetching the next set of message statuses.
          cursor: nil,
          request_options: {}
        )
        end

        # Removes all list subscriptions for given user.
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

        # Subscribes the given user to one or more lists. If the list does not exist, it
        # will be created.
        sig do
          params(
            user_id: String,
            lists:
              T::Array[Courier::Profiles::ListSubscribeParams::List::OrHash],
            request_options: Courier::RequestOptions::OrHash
          ).returns(Courier::Models::Profiles::ListSubscribeResponse)
        end
        def subscribe(
          # A unique identifier representing the user associated with the requested profile.
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
