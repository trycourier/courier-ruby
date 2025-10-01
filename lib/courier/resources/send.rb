# frozen_string_literal: true

module Courier
  module Resources
    class Send
      # Use the send API to send a message to one or more recipients.
      #
      # @overload send_message(message:, request_options: {})
      #
      # @param message [Courier::Models::Message::ContentMessage, Courier::Models::Message::TemplateMessage] Defines the message to be delivered
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::SendSendMessageResponse]
      #
      # @see Courier::Models::SendSendMessageParams
      def send_message(params)
        parsed, options = Courier::SendSendMessageParams.dump_request(params)
        @client.request(
          method: :post,
          path: "send",
          body: parsed,
          model: Courier::Models::SendSendMessageResponse,
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
