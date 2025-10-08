# frozen_string_literal: true

module Courier
  module Resources
    class Lists
      class Subscriptions
        # Get the list's subscriptions.
        #
        # @overload list(list_id, cursor: nil, request_options: {})
        #
        # @param list_id [String] A unique identifier representing the list you wish to retrieve.
        #
        # @param cursor [String, nil] A unique identifier that allows for fetching the next set of list subscriptions
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Courier::Models::Lists::SubscriptionListResponse]
        #
        # @see Courier::Models::Lists::SubscriptionListParams
        def list(list_id, params = {})
          parsed, options = Courier::Lists::SubscriptionListParams.dump_request(params)
          @client.request(
            method: :get,
            path: ["lists/%1$s/subscriptions", list_id],
            query: parsed,
            model: Courier::Models::Lists::SubscriptionListResponse,
            options: options
          )
        end

        # Subscribes additional users to the list, without modifying existing
        # subscriptions. If the list does not exist, it will be automatically created.
        #
        # @overload add(list_id, recipients:, request_options: {})
        #
        # @param list_id [String] A unique identifier representing the list you wish to retrieve.
        #
        # @param recipients [Array<Courier::Models::PutSubscriptionsRecipient>]
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Courier::Models::Lists::SubscriptionAddParams
        def add(list_id, params)
          parsed, options = Courier::Lists::SubscriptionAddParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["lists/%1$s/subscriptions", list_id],
            body: parsed,
            model: NilClass,
            options: options
          )
        end

        # Subscribes the users to the list, overwriting existing subscriptions. If the
        # list does not exist, it will be automatically created.
        #
        # @overload subscribe(list_id, recipients:, request_options: {})
        #
        # @param list_id [String] A unique identifier representing the list you wish to retrieve.
        #
        # @param recipients [Array<Courier::Models::PutSubscriptionsRecipient>]
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Courier::Models::Lists::SubscriptionSubscribeParams
        def subscribe(list_id, params)
          parsed, options = Courier::Lists::SubscriptionSubscribeParams.dump_request(params)
          @client.request(
            method: :put,
            path: ["lists/%1$s/subscriptions", list_id],
            body: parsed,
            model: NilClass,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Courier::Models::Lists::SubscriptionSubscribeUserParams} for more details.
        #
        # Subscribe a user to an existing list (note: if the List does not exist, it will
        # be automatically created).
        #
        # @overload subscribe_user(user_id, list_id:, preferences: nil, request_options: {})
        #
        # @param user_id [String] Path param: A unique identifier representing the recipient associated with the l
        #
        # @param list_id [String] Path param: A unique identifier representing the list you wish to retrieve.
        #
        # @param preferences [Courier::Models::RecipientPreferences, nil] Body param:
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Courier::Models::Lists::SubscriptionSubscribeUserParams
        def subscribe_user(user_id, params)
          parsed, options = Courier::Lists::SubscriptionSubscribeUserParams.dump_request(params)
          list_id =
            parsed.delete(:list_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :put,
            path: ["lists/%1$s/subscriptions/%2$s", list_id, user_id],
            body: parsed,
            model: NilClass,
            options: options
          )
        end

        # Delete a subscription to a list by list ID and user ID.
        #
        # @overload unsubscribe_user(user_id, list_id:, request_options: {})
        #
        # @param user_id [String] A unique identifier representing the recipient associated with the list
        #
        # @param list_id [String] A unique identifier representing the list you wish to retrieve.
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Courier::Models::Lists::SubscriptionUnsubscribeUserParams
        def unsubscribe_user(user_id, params)
          parsed, options = Courier::Lists::SubscriptionUnsubscribeUserParams.dump_request(params)
          list_id =
            parsed.delete(:list_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :delete,
            path: ["lists/%1$s/subscriptions/%2$s", list_id, user_id],
            model: NilClass,
            options: options
          )
        end

        # @api private
        #
        # @param client [Courier::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
