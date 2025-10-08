# frozen_string_literal: true

module Courier
  module Models
    class Preference < Courier::Internal::Type::BaseModel
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

      # @!attribute source
      #
      #   @return [Symbol, Courier::Models::Preference::Source, nil]
      optional :source, enum: -> { Courier::Preference::Source }, nil?: true

      # @!method initialize(status:, channel_preferences: nil, rules: nil, source: nil)
      #   @param status [Symbol, Courier::Models::PreferenceStatus]
      #   @param channel_preferences [Array<Courier::Models::ChannelPreference>, nil]
      #   @param rules [Array<Courier::Models::Rule>, nil]
      #   @param source [Symbol, Courier::Models::Preference::Source, nil]

      # @see Courier::Models::Preference#source
      module Source
        extend Courier::Internal::Type::Enum

        SUBSCRIPTION = :subscription
        LIST = :list
        RECIPIENT = :recipient

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
