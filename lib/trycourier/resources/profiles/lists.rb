# frozen_string_literal: true

module Trycourier
  module Resources
    class Profiles
      class Lists
        # Some parameter documentations has been truncated, see
        # {Trycourier::Models::Profiles::ListRetrieveParams} for more details.
        #
        # Returns the subscribed lists for a specified user.
        #
        # @overload retrieve(user_id, cursor: nil, request_options: {})
        #
        # @param user_id [String] A unique identifier representing the user associated with the requested profile.
        #
        # @param cursor [String, nil] A unique identifier that allows for fetching the next set of message statuses.
        #
        # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Trycourier::Models::Profiles::ListRetrieveResponse]
        #
        # @see Trycourier::Models::Profiles::ListRetrieveParams
        def retrieve(user_id, params = {})
          parsed, options = Trycourier::Profiles::ListRetrieveParams.dump_request(params)
          @client.request(
            method: :get,
            path: ["profiles/%1$s/lists", user_id],
            query: parsed,
            model: Trycourier::Models::Profiles::ListRetrieveResponse,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Trycourier::Models::Profiles::ListDeleteParams} for more details.
        #
        # Removes all list subscriptions for given user.
        #
        # @overload delete(user_id, request_options: {})
        #
        # @param user_id [String] A unique identifier representing the user associated with the requested profile.
        #
        # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Trycourier::Models::Profiles::ListDeleteResponse]
        #
        # @see Trycourier::Models::Profiles::ListDeleteParams
        def delete(user_id, params = {})
          @client.request(
            method: :delete,
            path: ["profiles/%1$s/lists", user_id],
            model: Trycourier::Models::Profiles::ListDeleteResponse,
            options: params[:request_options]
          )
        end

        # Some parameter documentations has been truncated, see
        # {Trycourier::Models::Profiles::ListSubscribeParams} for more details.
        #
        # Subscribes the given user to one or more lists. If the list does not exist, it
        # will be created.
        #
        # @overload subscribe(user_id, lists:, request_options: {})
        #
        # @param user_id [String] A unique identifier representing the user associated with the requested profile.
        #
        # @param lists [Array<Trycourier::Models::SubscribeToListsRequestItem>]
        #
        # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Trycourier::Models::Profiles::ListSubscribeResponse]
        #
        # @see Trycourier::Models::Profiles::ListSubscribeParams
        def subscribe(user_id, params)
          parsed, options = Trycourier::Profiles::ListSubscribeParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["profiles/%1$s/lists", user_id],
            body: parsed,
            model: Trycourier::Models::Profiles::ListSubscribeResponse,
            options: options
          )
        end

        # @api private
        #
        # @param client [Trycourier::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
