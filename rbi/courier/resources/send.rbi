# typed: strong

module Courier
  module Resources
    class Send
      # Use the send API to send a message to one or more recipients.
      sig do
        params(
          message: Courier::SendSendMessageParams::Message::OrHash,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::Models::SendSendMessageResponse)
      end
      def send_message(
        # The message property has the following primary top-level properties. They define
        # the destination and content of the message.
        message:,
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
