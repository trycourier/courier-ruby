# frozen_string_literal: true

module Courier
  module Resources
    class Profiles
      class Lists
        # Some parameter documentations has been truncated, see
        # {Courier::Models::Profiles::ListRetrieveParams} for more details.
        #
        # Returns the lists a user is subscribed to, with paging. Use it to check what a
        # recipient will receive before sending to a list.
        #
        # @overload retrieve(user_id, cursor: nil, request_options: {})
        #
        # @param user_id [String] A unique identifier representing the user associated with the requested user pro
        #
        # @param cursor [String, nil] A unique identifier that allows for fetching the next set of message statuses.
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Courier::Models::Profiles::ListRetrieveResponse]
        #
        # @see Courier::Models::Profiles::ListRetrieveParams
        def retrieve(user_id, params = {})
          parsed, options = Courier::Profiles::ListRetrieveParams.dump_request(params)
          query = Courier::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["profiles/%1$s/lists", user_id],
            query: query,
            model: Courier::Models::Profiles::ListRetrieveResponse,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Courier::Models::Profiles::ListDeleteParams} for more details.
        #
        # Removes every list subscription for a user at once. Their profile and
        # preferences are untouched, so this only affects list-targeted sends.
        #
        # @overload delete(user_id, request_options: {})
        #
        # @param user_id [String] A unique identifier representing the user associated with the requested profile.
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Courier::Models::Profiles::ListDeleteResponse]
        #
        # @see Courier::Models::Profiles::ListDeleteParams
        def delete(user_id, params = {})
          @client.request(
            method: :delete,
            path: ["profiles/%1$s/lists", user_id],
            model: Courier::Models::Profiles::ListDeleteResponse,
            options: params[:request_options]
          )
        end

        # Some parameter documentations has been truncated, see
        # {Courier::Models::Profiles::ListSubscribeParams} for more details.
        #
        # Subscribes a user to one or more lists, creating any list that does not yet
        # exist. Optional preferences apply to each subscription.
        #
        # @overload subscribe(user_id, lists:, idempotency_key: nil, x_idempotency_expiration: nil, request_options: {})
        #
        # @param user_id [String] Path param: A unique identifier representing the user associated with the reques
        #
        # @param lists [Array<Courier::Models::SubscribeToListsRequestItem>] Body param
        #
        # @param idempotency_key [String] Header param: A unique key that makes this request idempotent. If Courier receiv
        #
        # @param x_idempotency_expiration [String] Header param: How long the idempotency key remains valid, as a Unix epoch timest
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Courier::Models::Profiles::ListSubscribeResponse]
        #
        # @see Courier::Models::Profiles::ListSubscribeParams
        def subscribe(user_id, params)
          parsed, options = Courier::Profiles::ListSubscribeParams.dump_request(params)
          header_params =
            {idempotency_key: "idempotency-key", x_idempotency_expiration: "x-idempotency-expiration"}
          @client.request(
            method: :post,
            path: ["profiles/%1$s/lists", user_id],
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: Courier::Models::Profiles::ListSubscribeResponse,
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
