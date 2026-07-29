# typed: strong

module Courier
  module Resources
    # Look up the messages Courier has accepted, inspect their delivery history and
    # rendered output, and cancel, resend, or archive them.
    class Requests
      # Archives a send request by its request id. Use it to remove test sends or
      # superseded requests from the message list without deleting them.
      sig do
        params(
          request_id: String,
          request_options: Courier::RequestOptions::OrHash
        ).void
      end
      def archive(
        # A unique identifier representing the request ID
        request_id,
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
