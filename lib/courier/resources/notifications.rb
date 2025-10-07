# frozen_string_literal: true

module Courier
  module Resources
    class Notifications
      # @return [Courier::Resources::Notifications::Draft]
      attr_reader :draft

      # @return [Courier::Resources::Notifications::Checks]
      attr_reader :checks

      # @overload list(cursor: nil, notes: nil, request_options: {})
      #
      # @param cursor [String, nil]
      #
      # @param notes [Boolean, nil] Retrieve the notes from the Notification template settings.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::NotificationListResponse]
      #
      # @see Courier::Models::NotificationListParams
      def list(params = {})
        parsed, options = Courier::NotificationListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "notifications",
          query: parsed,
          model: Courier::Models::NotificationListResponse,
          options: options
        )
      end

      # @overload retrieve_content(id, request_options: {})
      #
      # @param id [String]
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::NotificationGetContent]
      #
      # @see Courier::Models::NotificationRetrieveContentParams
      def retrieve_content(id, params = {})
        @client.request(
          method: :get,
          path: ["notifications/%1$s/content", id],
          model: Courier::NotificationGetContent,
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [Courier::Client]
      def initialize(client:)
        @client = client
        @draft = Courier::Resources::Notifications::Draft.new(client: client)
        @checks = Courier::Resources::Notifications::Checks.new(client: client)
      end
    end
  end
end
