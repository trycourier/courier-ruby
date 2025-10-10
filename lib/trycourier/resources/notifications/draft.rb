# frozen_string_literal: true

module Trycourier
  module Resources
    class Notifications
      class Draft
        # @overload retrieve_content(id, request_options: {})
        #
        # @param id [String]
        # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Trycourier::Models::NotificationGetContent]
        #
        # @see Trycourier::Models::Notifications::DraftRetrieveContentParams
        def retrieve_content(id, params = {})
          @client.request(
            method: :get,
            path: ["notifications/%1$s/draft/content", id],
            model: Trycourier::NotificationGetContent,
            options: params[:request_options]
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
