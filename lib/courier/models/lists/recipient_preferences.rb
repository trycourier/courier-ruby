# frozen_string_literal: true

module Courier
  module Models
    module Lists
      class RecipientPreferences < Courier::Internal::Type::BaseModel
        # @!attribute categories
        #
        #   @return [Hash{Symbol=>Courier::Models::Lists::RecipientPreferences::Category}, nil]
        optional :categories,
                 -> { Courier::Internal::Type::HashOf[Courier::Lists::RecipientPreferences::Category] },
                 nil?: true

        # @!attribute notifications
        #
        #   @return [Hash{Symbol=>Courier::Models::Lists::RecipientPreferences::Notification}, nil]
        optional :notifications,
                 -> { Courier::Internal::Type::HashOf[Courier::Lists::RecipientPreferences::Notification] },
                 nil?: true

        # @!method initialize(categories: nil, notifications: nil)
        #   @param categories [Hash{Symbol=>Courier::Models::Lists::RecipientPreferences::Category}, nil]
        #   @param notifications [Hash{Symbol=>Courier::Models::Lists::RecipientPreferences::Notification}, nil]

        class Category < Courier::Internal::Type::BaseModel
          # @!attribute status
          #
          #   @return [Symbol, Courier::Models::Users::PreferenceStatus]
          required :status, enum: -> { Courier::Users::PreferenceStatus }

          # @!attribute channel_preferences
          #
          #   @return [Array<Courier::Models::Lists::RecipientPreferences::Category::ChannelPreference>, nil]
          optional :channel_preferences,
                   -> {
                     Courier::Internal::Type::ArrayOf[Courier::Lists::RecipientPreferences::Category::ChannelPreference]
                   },
                   nil?: true

          # @!attribute rules
          #
          #   @return [Array<Courier::Models::Lists::RecipientPreferences::Category::Rule>, nil]
          optional :rules,
                   -> {
                     Courier::Internal::Type::ArrayOf[Courier::Lists::RecipientPreferences::Category::Rule]
                   },
                   nil?: true

          # @!method initialize(status:, channel_preferences: nil, rules: nil)
          #   @param status [Symbol, Courier::Models::Users::PreferenceStatus]
          #   @param channel_preferences [Array<Courier::Models::Lists::RecipientPreferences::Category::ChannelPreference>, nil]
          #   @param rules [Array<Courier::Models::Lists::RecipientPreferences::Category::Rule>, nil]

          class ChannelPreference < Courier::Internal::Type::BaseModel
            # @!attribute channel
            #
            #   @return [Symbol, Courier::Models::Tenants::DefaultPreferences::ChannelClassification]
            required :channel, enum: -> { Courier::Tenants::DefaultPreferences::ChannelClassification }

            # @!method initialize(channel:)
            #   @param channel [Symbol, Courier::Models::Tenants::DefaultPreferences::ChannelClassification]
          end

          class Rule < Courier::Internal::Type::BaseModel
            # @!attribute until_
            #
            #   @return [String]
            required :until_, String, api_name: :until

            # @!attribute start
            #
            #   @return [String, nil]
            optional :start, String, nil?: true

            # @!method initialize(until_:, start: nil)
            #   @param until_ [String]
            #   @param start [String, nil]
          end
        end

        class Notification < Courier::Internal::Type::BaseModel
          # @!attribute status
          #
          #   @return [Symbol, Courier::Models::Users::PreferenceStatus]
          required :status, enum: -> { Courier::Users::PreferenceStatus }

          # @!attribute channel_preferences
          #
          #   @return [Array<Courier::Models::Lists::RecipientPreferences::Notification::ChannelPreference>, nil]
          optional :channel_preferences,
                   -> {
                     Courier::Internal::Type::ArrayOf[Courier::Lists::RecipientPreferences::Notification::ChannelPreference]
                   },
                   nil?: true

          # @!attribute rules
          #
          #   @return [Array<Courier::Models::Lists::RecipientPreferences::Notification::Rule>, nil]
          optional :rules,
                   -> {
                     Courier::Internal::Type::ArrayOf[Courier::Lists::RecipientPreferences::Notification::Rule]
                   },
                   nil?: true

          # @!method initialize(status:, channel_preferences: nil, rules: nil)
          #   @param status [Symbol, Courier::Models::Users::PreferenceStatus]
          #   @param channel_preferences [Array<Courier::Models::Lists::RecipientPreferences::Notification::ChannelPreference>, nil]
          #   @param rules [Array<Courier::Models::Lists::RecipientPreferences::Notification::Rule>, nil]

          class ChannelPreference < Courier::Internal::Type::BaseModel
            # @!attribute channel
            #
            #   @return [Symbol, Courier::Models::Tenants::DefaultPreferences::ChannelClassification]
            required :channel, enum: -> { Courier::Tenants::DefaultPreferences::ChannelClassification }

            # @!method initialize(channel:)
            #   @param channel [Symbol, Courier::Models::Tenants::DefaultPreferences::ChannelClassification]
          end

          class Rule < Courier::Internal::Type::BaseModel
            # @!attribute until_
            #
            #   @return [String]
            required :until_, String, api_name: :until

            # @!attribute start
            #
            #   @return [String, nil]
            optional :start, String, nil?: true

            # @!method initialize(until_:, start: nil)
            #   @param until_ [String]
            #   @param start [String, nil]
          end
        end
      end
    end
  end
end
