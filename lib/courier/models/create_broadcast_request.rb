# frozen_string_literal: true

module Courier
  module Models
    class CreateBroadcastRequest < Courier::Internal::Type::BaseModel
      # @!attribute channel
      #   The single delivery channel for this broadcast.
      #
      #   @return [Symbol, Courier::Models::CreateBroadcastRequest::Channel]
      required :channel, enum: -> { Courier::CreateBroadcastRequest::Channel }

      # @!attribute name
      #   Human-readable name.
      #
      #   @return [String]
      required :name, String

      # @!method initialize(channel:, name:)
      #   Request body for creating a broadcast.
      #
      #   @param channel [Symbol, Courier::Models::CreateBroadcastRequest::Channel] The single delivery channel for this broadcast.
      #
      #   @param name [String] Human-readable name.

      # The single delivery channel for this broadcast.
      #
      # @see Courier::Models::CreateBroadcastRequest#channel
      module Channel
        extend Courier::Internal::Type::Enum

        EMAIL = :email
        SMS = :sms
        PUSH = :push
        INBOX = :inbox
        SLACK = :slack
        MSTEAMS = :msteams

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
