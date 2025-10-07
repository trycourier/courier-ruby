# frozen_string_literal: true

module Courier
  module Models
    class ChannelPreference < Courier::Internal::Type::BaseModel
      # @!attribute channel
      #
      #   @return [Symbol, Courier::Models::Tenants::DefaultPreferences::ChannelClassification]
      required :channel, enum: -> { Courier::Tenants::DefaultPreferences::ChannelClassification }

      # @!method initialize(channel:)
      #   @param channel [Symbol, Courier::Models::Tenants::DefaultPreferences::ChannelClassification]
    end
  end
end
