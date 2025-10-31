# frozen_string_literal: true

module Trycourier
  module Resources
    class Send
      # Some parameter documentations has been truncated, see
      # {Trycourier::Models::SendMessageParams} for more details.
      #
      # API to send a message to one or more recipients.
      #
      # @overload message(message:, request_options: {})
      #
      # @param message [Trycourier::Models::SendMessageParams::Message] The message property has the following primary top-level properties. They define
      #
      # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Trycourier::Models::SendMessageResponse]
      #
      # @see Trycourier::Models::SendMessageParams
      def message(params)
        parsed, options = Trycourier::SendMessageParams.dump_request(params)
        @client.request(
          method: :post,
          path: "send",
          body: parsed,
          model: Trycourier::Models::SendMessageResponse,
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
