# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Messages#resend
    class MessageResendResponse < Courier::Internal::Type::BaseModel
      # @!attribute message_id
      #   The new message id for the resent message. It is distinct from the id of the
      #   original message that was resent.
      #
      #   @return [String]
      required :message_id, String, api_name: :messageId

      # @!method initialize(message_id:)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::MessageResendResponse} for more details.
      #
      #   @param message_id [String] The new message id for the resent message. It is distinct from the id of the ori
    end
  end
end
