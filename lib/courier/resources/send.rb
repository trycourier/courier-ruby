# frozen_string_literal: true

module Courier
  module Resources
    class Send
      # Some parameter documentations has been truncated, see
      # {Courier::Models::SendMessageParams} for more details.
      #
      # Use the send API to send a message to one or more recipients.
      #
      # @overload message(message:, request_options: {})
      #
      # @param message [Courier::Models::SendMessageParams::Message] The message property has the following primary top-level properties. They define
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::SendMessageResponse]
      #
      # @see Courier::Models::SendMessageParams
      def message(params)
        parsed, options = Courier::SendMessageParams.dump_request(params)
        @client.request(
          method: :post,
          path: "send",
          body: parsed,
          model: Courier::Models::SendMessageResponse,
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
