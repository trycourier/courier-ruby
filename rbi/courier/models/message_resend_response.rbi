# typed: strong

module Courier
  module Models
    class MessageResendResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::Models::MessageResendResponse,
            Courier::Internal::AnyHash
          )
        end

      # The new message id for the resent message. It is distinct from the id of the
      # original message that was resent.
      sig { returns(String) }
      attr_accessor :message_id

      sig { params(message_id: String).returns(T.attached_class) }
      def self.new(
        # The new message id for the resent message. It is distinct from the id of the
        # original message that was resent.
        message_id:
      )
      end

      sig { override.returns({ message_id: String }) }
      def to_hash
      end
    end
  end
end
