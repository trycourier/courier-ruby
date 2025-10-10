# frozen_string_literal: true

module Trycourier
  module Resources
    class Lists
      # @return [Trycourier::Resources::Lists::Subscriptions]
      attr_reader :subscriptions

      # Returns a list based on the list ID provided.
      #
      # @overload retrieve(list_id, request_options: {})
      #
      # @param list_id [String] A unique identifier representing the list you wish to retrieve.
      #
      # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Trycourier::Models::SubscriptionList]
      #
      # @see Trycourier::Models::ListRetrieveParams
      def retrieve(list_id, params = {})
        @client.request(
          method: :get,
          path: ["lists/%1$s", list_id],
          model: Trycourier::SubscriptionList,
          options: params[:request_options]
        )
      end

      # Create or replace an existing list with the supplied values.
      #
      # @overload update(list_id, name:, preferences: nil, request_options: {})
      #
      # @param list_id [String] A unique identifier representing the list you wish to retrieve.
      #
      # @param name [String]
      #
      # @param preferences [Trycourier::Models::RecipientPreferences, nil]
      #
      # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Trycourier::Models::ListUpdateParams
      def update(list_id, params)
        parsed, options = Trycourier::ListUpdateParams.dump_request(params)
        @client.request(
          method: :put,
          path: ["lists/%1$s", list_id],
          body: parsed,
          model: NilClass,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Trycourier::Models::ListListParams} for more details.
      #
      # Returns all of the lists, with the ability to filter based on a pattern.
      #
      # @overload list(cursor: nil, pattern: nil, request_options: {})
      #
      # @param cursor [String, nil] A unique identifier that allows for fetching the next page of lists.
      #
      # @param pattern [String, nil] "A pattern used to filter the list items returned. Pattern types supported: exac
      #
      # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Trycourier::Models::ListListResponse]
      #
      # @see Trycourier::Models::ListListParams
      def list(params = {})
        parsed, options = Trycourier::ListListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "lists",
          query: parsed,
          model: Trycourier::Models::ListListResponse,
          options: options
        )
      end

      # Delete a list by list ID.
      #
      # @overload delete(list_id, request_options: {})
      #
      # @param list_id [String] A unique identifier representing the list you wish to retrieve.
      #
      # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Trycourier::Models::ListDeleteParams
      def delete(list_id, params = {})
        @client.request(
          method: :delete,
          path: ["lists/%1$s", list_id],
          model: NilClass,
          options: params[:request_options]
        )
      end

      # Restore a previously deleted list.
      #
      # @overload restore(list_id, request_options: {})
      #
      # @param list_id [String] A unique identifier representing the list you wish to retrieve.
      #
      # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Trycourier::Models::ListRestoreParams
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
      # @param client [Trycourier::Client]
      def initialize(client:)
        @client = client
        @subscriptions = Trycourier::Resources::Lists::Subscriptions.new(client: client)
      end
    end
  end
end
