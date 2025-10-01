# typed: strong

module Courier
  module Resources
    class Send
      # Use the send API to send a message to one or more recipients.
      sig do
        params(
          message:
            T.any(
              Courier::Message::ContentMessage::OrHash,
              Courier::Message::TemplateMessage::OrHash
            ),
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::Models::SendMessageResponse)
      end
      def message(
        # Defines the message to be delivered
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
