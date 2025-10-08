# frozen_string_literal: true

module Courier
  module Models
    class NotificationPreferenceDetails < Courier::Internal::Type::BaseModel
      # @!attribute status
      #
      #   @return [Symbol, Courier::Models::PreferenceStatus]
      required :status, enum: -> { Courier::PreferenceStatus }

      # @!attribute channel_preferences
      #
      #   @return [Array<Courier::Models::ChannelPreference>, nil]
      optional :channel_preferences,
               -> { Courier::Internal::Type::ArrayOf[Courier::ChannelPreference] },
               nil?: true

      # @!attribute rules
      #
      #   @return [Array<Courier::Models::Rule>, nil]
      optional :rules, -> { Courier::Internal::Type::ArrayOf[Courier::Rule] }, nil?: true

      # @!method initialize(status:, channel_preferences: nil, rules: nil)
      #   @param status [Symbol, Courier::Models::PreferenceStatus]
      #   @param channel_preferences [Array<Courier::Models::ChannelPreference>, nil]
      #   @param rules [Array<Courier::Models::Rule>, nil]
    end
  end
end
