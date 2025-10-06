# frozen_string_literal: true

module Courier
  module Resources
    class Lists
      # @return [Courier::Resources::Lists::Subscriptions]
      attr_reader :subscriptions

      # Returns a list based on the list ID provided.
      #
      # @overload retrieve(list_id, request_options: {})
      #
      # @param list_id [String] A unique identifier representing the list you wish to retrieve.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::List]
      #
      # @see Courier::Models::ListRetrieveParams
      def retrieve(list_id, params = {})
        @client.request(
          method: :get,
          path: ["lists/%1$s", list_id],
          model: Courier::List,
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
      # @param preferences [Courier::Models::Lists::RecipientPreferences, nil]
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
      # Returns all of the lists, with the ability to filter based on a pattern.
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
        @client.request(
          method: :get,
          path: "lists",
          query: parsed,
          model: Courier::Models::ListListResponse,
          options: options
        )
      end

      # Delete a list by list ID.
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

      # Restore a previously deleted list.
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
