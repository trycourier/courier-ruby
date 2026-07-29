# frozen_string_literal: true

module Courier
  module Models
    class SendBroadcastRequest < Courier::Internal::Type::BaseModel
      # @!attribute recipient_id
      #   ID of the target list or audience.
      #
      #   @return [String]
      required :recipient_id, String

      # @!attribute recipient_type
      #   Whether the broadcast targets a list or an audience.
      #
      #   @return [Symbol, Courier::Models::SendBroadcastRequest::RecipientType]
      required :recipient_type, enum: -> { Courier::SendBroadcastRequest::RecipientType }

      # @!method initialize(recipient_id:, recipient_type:)
      #   Request body for sending a broadcast immediately.
      #
      #   @param recipient_id [String] ID of the target list or audience.
      #
      #   @param recipient_type [Symbol, Courier::Models::SendBroadcastRequest::RecipientType] Whether the broadcast targets a list or an audience.

      # Whether the broadcast targets a list or an audience.
      #
      # @see Courier::Models::SendBroadcastRequest#recipient_type
      module RecipientType
        extend Courier::Internal::Type::Enum

        LIST = :list
        AUDIENCE = :audience

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
