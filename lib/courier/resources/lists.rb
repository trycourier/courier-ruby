# frozen_string_literal: true

module Courier
  module Resources
    # Manage static groups of users that you subscribe explicitly, and send to them by
    # list id or list pattern.
    class Lists
      # Manage static groups of users that you subscribe explicitly, and send to them by
      # list id or list pattern.
      # @return [Courier::Resources::Lists::Subscriptions]
      attr_reader :subscriptions

      # Returns one list by id with its name and created and updated timestamps. Fetch
      # its subscribers separately with the subscriptions endpoint.
      #
      # @overload retrieve(list_id, request_options: {})
      #
      # @param list_id [String] A unique identifier representing the list you wish to retrieve.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::SubscriptionList]
      #
      # @see Courier::Models::ListRetrieveParams
      def retrieve(list_id, params = {})
        @client.request(
          method: :get,
          path: ["lists/%1$s", list_id],
          model: Courier::SubscriptionList,
          options: params[:request_options]
        )
      end

      # Creates or replaces a list from a name and preferences. Subscribers are managed
      # through the separate subscriptions endpoints.
      #
      # @overload update(list_id, name:, preferences: nil, request_options: {})
      #
      # @param list_id [String] A unique identifier representing the list you wish to retrieve.
      #
      # @param name [String]
      #
      # @param preferences [Courier::Models::RecipientPreferences, nil]
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Courier::Models::ListUpdateParams
      def update(list_id, params)
        parsed, options = Courier::ListUpdateParams.dump_request(params)
        @client.request(
          method: :put,
          path: ["lists/%1$s", list_id],
          body: parsed,
          model: NilClass,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Courier::Models::ListListParams} for more details.
      #
      # Returns the workspace's lists, filterable by a pattern to fetch a subset such as
      # every regional list. Paged by cursor.
      #
      # @overload list(cursor: nil, pattern: nil, request_options: {})
      #
      # @param cursor [String, nil] A unique identifier that allows for fetching the next page of lists.
      #
      # @param pattern [String, nil] "A pattern used to filter the list items returned. Pattern types supported: exac
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::ListListResponse]
      #
      # @see Courier::Models::ListListParams
      def list(params = {})
        parsed, options = Courier::ListListParams.dump_request(params)
        query = Courier::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "lists",
          query: query,
          model: Courier::Models::ListListResponse,
          options: options
        )
      end

      # Deletes a list, halting sends that target it. A previously deleted list can be
      # brought back with the companion restore endpoint.
      #
      # @overload delete(list_id, request_options: {})
      #
      # @param list_id [String] A unique identifier representing the list you wish to retrieve.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Courier::Models::ListDeleteParams
      def delete(list_id, params = {})
        @client.request(
          method: :delete,
          path: ["lists/%1$s", list_id],
          model: NilClass,
          options: params[:request_options]
        )
      end

      # Restores a previously deleted list along with its subscribers, so a list removed
      # by mistake can be brought back rather than rebuilt.
      #
      # @overload restore(list_id, request_options: {})
      #
      # @param list_id [String] A unique identifier representing the list you wish to retrieve.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Courier::Models::ListRestoreParams
      def restore(list_id, params = {})
        @client.request(
          method: :put,
          path: ["lists/%1$s/restore", list_id],
          model: NilClass,
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [Courier::Client]
      def initialize(client:)
        @client = client
        @subscriptions = Courier::Resources::Lists::Subscriptions.new(client: client)
      end
    end
  end
end
