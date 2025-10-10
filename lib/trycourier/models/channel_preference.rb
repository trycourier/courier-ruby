# frozen_string_literal: true

module Trycourier
  module Models
    class ChannelPreference < Trycourier::Internal::Type::BaseModel
      # @!attribute channel
      #
      #   @return [Symbol, Trycourier::Models::ChannelClassification]
      required :channel, enum: -> { Trycourier::ChannelClassification }

      # @!method initialize(channel:)
      #   @param channel [Symbol, Trycourier::Models::ChannelClassification]
    end
  end
end
