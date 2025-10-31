# typed: strong

module Trycourier
  module Resources
    class Send
      # API to send a message to one or more recipients.
      sig do
        params(
          message: Trycourier::SendMessageParams::Message::OrHash,
          request_options: Trycourier::RequestOptions::OrHash
        ).returns(Trycourier::Models::SendMessageResponse)
      end
      def message(
        # The message property has the following primary top-level properties. They define
        # the destination and content of the message.
        message:,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Trycourier::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
