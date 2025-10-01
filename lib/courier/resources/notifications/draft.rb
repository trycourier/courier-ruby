# frozen_string_literal: true

module Courier
  module Resources
    class Notifications
      class Draft
        # @overload retrieve_content(id, request_options: {})
        #
        # @param id [String]
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Courier::Models::NotificationGetContent]
        #
        # @see Courier::Models::Notifications::DraftRetrieveContentParams
        def retrieve_content(id, params = {})
          @client.request(
            method: :get,
            path: ["notifications/%1$s/draft/content", id],
            model: Courier::NotificationGetContent,
            options: params[:request_options]
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
