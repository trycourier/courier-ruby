# frozen_string_literal: true

module Trycourier
  module Resources
    class Notifications
      # @return [Trycourier::Resources::Notifications::Draft]
      attr_reader :draft

      # @return [Trycourier::Resources::Notifications::Checks]
      attr_reader :checks

      # @overload list(cursor: nil, notes: nil, request_options: {})
      #
      # @param cursor [String, nil]
      #
      # @param notes [Boolean, nil] Retrieve the notes from the Notification template settings.
      #
      # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Trycourier::Models::NotificationListResponse]
      #
      # @see Trycourier::Models::NotificationListParams
      def list(params = {})
        parsed, options = Trycourier::NotificationListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "notifications",
          query: parsed,
          model: Trycourier::Models::NotificationListResponse,
          options: options
        )
      end

      # @overload retrieve_content(id, request_options: {})
      #
      # @param id [String]
      # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Trycourier::Models::NotificationGetContent]
      #
      # @see Trycourier::Models::NotificationRetrieveContentParams
      def retrieve_content(id, params = {})
        @client.request(
          method: :get,
          path: ["notifications/%1$s/content", id],
          model: Trycourier::NotificationGetContent,
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [Trycourier::Client]
      def initialize(client:)
        @client = client
        @draft = Trycourier::Resources::Notifications::Draft.new(client: client)
        @checks = Trycourier::Resources::Notifications::Checks.new(client: client)
      end
    end
  end
end
