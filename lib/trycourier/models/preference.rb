# frozen_string_literal: true

module Trycourier
  module Models
    class Preference < Trycourier::Internal::Type::BaseModel
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

      # @!attribute source
      #
      #   @return [Symbol, Trycourier::Models::Preference::Source, nil]
      optional :source, enum: -> { Trycourier::Preference::Source }, nil?: true

      # @!method initialize(status:, channel_preferences: nil, rules: nil, source: nil)
      #   @param status [Symbol, Trycourier::Models::PreferenceStatus]
      #   @param channel_preferences [Array<Trycourier::Models::ChannelPreference>, nil]
      #   @param rules [Array<Trycourier::Models::Rule>, nil]
      #   @param source [Symbol, Trycourier::Models::Preference::Source, nil]

      # @see Trycourier::Models::Preference#source
      module Source
        extend Trycourier::Internal::Type::Enum

        SUBSCRIPTION = :subscription
        LIST = :list
        RECIPIENT = :recipient

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
