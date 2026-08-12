# typed: strong

module Courier
  module Resources
    # Send a message to one or more recipients — users, lists, audiences, or tenants —
    # across every channel you have configured.
    class Send
      # Sends a message to one or more recipients and returns a requestId. Courier
      # routes it to email, SMS, push, chat, or in-app based on your rules. Use the
      # returned requestId to look up delivery status via the Messages API.
      sig do
        params(
          message: Courier::SendMessageParams::Message::OrHash,
          idempotency_key: String,
          x_idempotency_expiration: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::Models::SendMessageResponse)
      end
      def message(
        # Body param: The message property has the following primary top-level properties.
        # They define the destination and content of the message.
        message:,
        # Header param: A unique key that makes this request idempotent. If Courier
        # receives another request with the same `Idempotency-Key`, it returns the stored
        # response from the first request without performing the operation again
        # (including the original status code and any error). Use it to safely retry
        # `POST` requests after network failures without risking duplicate sends. The key
        # is scoped to this endpoint.
        idempotency_key: nil,
        # Header param: How long the idempotency key remains valid, as a Unix epoch
        # timestamp in seconds or an ISO 8601 date string. Only applies when
        # `Idempotency-Key` is provided. If omitted, the key is retained for 25 hours; the
        # maximum is 1 year.
        x_idempotency_expiration: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Courier::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
