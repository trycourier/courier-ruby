# frozen_string_literal: true

module Courier
  module Models
    class ChannelPreference < Courier::Internal::Type::BaseModel
      # @!attribute channel
      #
      #   @return [Symbol, Courier::Models::ChannelClassification]
      required :channel, enum: -> { Courier::ChannelClassification }

      # @!method initialize(channel:)
      #   @param channel [Symbol, Courier::Models::ChannelClassification]
    end
  end
end
