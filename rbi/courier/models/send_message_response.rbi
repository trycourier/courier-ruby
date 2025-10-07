# typed: strong

module Courier
  module Models
    class SendMessageResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::Models::SendMessageResponse,
            Courier::Internal::AnyHash
          )
        end

      # A successful call to `POST /send` returns a `202` status code along with a
      # `requestId` in the response body. For single-recipient requests, the `requestId`
      # is the derived message_id. For multiple recipients, Courier assigns a unique
      # message_id to each derived message.
      sig { returns(String) }
      attr_accessor :request_id

      sig { params(request_id: String).returns(T.attached_class) }
      def self.new(
        # A successful call to `POST /send` returns a `202` status code along with a
        # `requestId` in the response body. For single-recipient requests, the `requestId`
        # is the derived message_id. For multiple recipients, Courier assigns a unique
        # message_id to each derived message.
        request_id:
      )
      end

      sig { override.returns({ request_id: String }) }
      def to_hash
      end
    end
  end
end
