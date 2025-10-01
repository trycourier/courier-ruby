# typed: strong

module Courier
  module Models
    class SendSendMessageResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::Models::SendSendMessageResponse,
            Courier::Internal::AnyHash
          )
        end

      # A successful call to `POST /send` returns a `202` status code along with a
      # `requestId` in the response body.
      #
      # For send requests that have a single recipient, the `requestId` is assigned to
      # the derived message as its message_id. Therefore the `requestId` can be supplied
      # to the Message's API for single recipient messages.
      #
      # For send requests that have multiple recipients (accounts, audiences, lists,
      # etc.), Courier assigns a unique id to each derived message as its `message_id`.
      # Therefore the `requestId` cannot be supplied to the Message's API for
      # single-recipient messages.
      sig { returns(String) }
      attr_accessor :request_id

      sig { params(request_id: String).returns(T.attached_class) }
      def self.new(
        # A successful call to `POST /send` returns a `202` status code along with a
        # `requestId` in the response body.
        #
        # For send requests that have a single recipient, the `requestId` is assigned to
        # the derived message as its message_id. Therefore the `requestId` can be supplied
        # to the Message's API for single recipient messages.
        #
        # For send requests that have multiple recipients (accounts, audiences, lists,
        # etc.), Courier assigns a unique id to each derived message as its `message_id`.
        # Therefore the `requestId` cannot be supplied to the Message's API for
        # single-recipient messages.
        request_id:
      )
      end

      sig { override.returns({ request_id: String }) }
      def to_hash
      end
    end
  end
end
