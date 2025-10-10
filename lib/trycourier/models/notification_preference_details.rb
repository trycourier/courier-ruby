# frozen_string_literal: true

module Trycourier
  module Models
    class NotificationPreferenceDetails < Trycourier::Internal::Type::BaseModel
      # @!attribute status
      #
      #   @return [Symbol, Trycourier::Models::PreferenceStatus]
      required :status, enum: -> { Trycourier::PreferenceStatus }

      # @!attribute channel_preferences
      #
      #   @return [Array<Trycourier::Models::ChannelPreference>, nil]
      optional :channel_preferences,
               -> { Trycourier::Internal::Type::ArrayOf[Trycourier::ChannelPreference] },
               nil?: true

      # @!attribute rules
      #
      #   @return [Array<Trycourier::Models::Rule>, nil]
      optional :rules, -> { Trycourier::Internal::Type::ArrayOf[Trycourier::Rule] }, nil?: true

      # @!method initialize(status:, channel_preferences: nil, rules: nil)
      #   @param status [Symbol, Trycourier::Models::PreferenceStatus]
      #   @param channel_preferences [Array<Trycourier::Models::ChannelPreference>, nil]
      #   @param rules [Array<Trycourier::Models::Rule>, nil]
    end
  end
end
