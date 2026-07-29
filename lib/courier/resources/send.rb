# frozen_string_literal: true

module Courier
  module Resources
    # Send a message to one or more recipients — users, lists, audiences, or tenants —
    # across every channel you have configured.
    class Send
      # Some parameter documentations has been truncated, see
      # {Courier::Models::SendMessageParams} for more details.
      #
      # Sends a message to one or more recipients and returns a requestId. Courier
      # routes it to email, SMS, push, chat, or in-app based on your rules.
      #
      # @overload message(message:, idempotency_key: nil, x_idempotency_expiration: nil, request_options: {})
      #
      # @param message [Courier::Models::SendMessageParams::Message] Body param: The message property has the following primary top-level properties.
      #
      # @param idempotency_key [String] Header param: A unique key that makes this request idempotent. If Courier receiv
      #
      # @param x_idempotency_expiration [String] Header param: How long the idempotency key remains valid, as a Unix epoch timest
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::SendMessageResponse]
      #
      # @see Courier::Models::SendMessageParams
      def message(params)
        parsed, options = Courier::SendMessageParams.dump_request(params)
        header_params =
          {idempotency_key: "idempotency-key", x_idempotency_expiration: "x-idempotency-expiration"}
        @client.request(
          method: :post,
          path: "send",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
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
