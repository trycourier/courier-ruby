# typed: strong

module Courier
  module Models
    class InboundTrackEventResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::Models::InboundTrackEventResponse,
            Courier::Internal::AnyHash
          )
        end

      # A successful call returns a `202` status code along with a `requestId` in the
      # response body.
      sig { returns(String) }
      attr_accessor :message_id

      sig { params(message_id: String).returns(T.attached_class) }
      def self.new(
        # A successful call returns a `202` status code along with a `requestId` in the
        # response body.
        message_id:
      )
      end

      sig { override.returns({ message_id: String }) }
      def to_hash
      end
    end
  end
end
