# frozen_string_literal: true

module Courier
  module Models
    class UserRecipient < Courier::Internal::Type::BaseModel
      # @!attribute account_id
      #   Use `tenant_id` instead.
      #
      #   @return [String, nil]
      optional :account_id, String, nil?: true

      # @!attribute context
      #   Context such as tenant_id to send the notification with.
      #
      #   @return [Courier::Models::MessageContext, nil]
      optional :context, -> { Courier::MessageContext }, nil?: true

      # @!attribute data
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :data, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown], nil?: true

      # @!attribute email
      #
      #   @return [String, nil]
      optional :email, String, nil?: true

      # @!attribute locale
      #   The user's preferred ISO 639-1 language code.
      #
      #   @return [String, nil]
      optional :locale, String, nil?: true

      # @!attribute phone_number
      #
      #   @return [String, nil]
      optional :phone_number, String, nil?: true

      # @!attribute preferences
      #
      #   @return [Courier::Models::UserRecipient::Preferences, nil]
      optional :preferences, -> { Courier::UserRecipient::Preferences }, nil?: true

      # @!attribute tenant_id
      #   Tenant id. Will load brand, default preferences and base context data.
      #
      #   @return [String, nil]
      optional :tenant_id, String, nil?: true

      # @!attribute user_id
      #
      #   @return [String, nil]
      optional :user_id, String, nil?: true

      # @!method initialize(account_id: nil, context: nil, data: nil, email: nil, locale: nil, phone_number: nil, preferences: nil, tenant_id: nil, user_id: nil)
      #   @param account_id [String, nil] Use `tenant_id` instead.
      #
      #   @param context [Courier::Models::MessageContext, nil] Context such as tenant_id to send the notification with.
      #
      #   @param data [Hash{Symbol=>Object}, nil]
      #
      #   @param email [String, nil]
      #
      #   @param locale [String, nil] The user's preferred ISO 639-1 language code.
      #
      #   @param phone_number [String, nil]
      #
      #   @param preferences [Courier::Models::UserRecipient::Preferences, nil]
      #
      #   @param tenant_id [String, nil] Tenant id. Will load brand, default preferences and base context data.
      #
      #   @param user_id [String, nil]

      # @see Courier::Models::UserRecipient#preferences
      class Preferences < Courier::Internal::Type::BaseModel
        # @!attribute notifications
        #
        #   @return [Hash{Symbol=>Courier::Models::UserRecipient::Preferences::Notification}]
        required :notifications,
                 -> { Courier::Internal::Type::HashOf[Courier::UserRecipient::Preferences::Notification] }

        # @!attribute categories
        #
        #   @return [Hash{Symbol=>Courier::Models::UserRecipient::Preferences::Category}, nil]
        optional :categories,
                 -> { Courier::Internal::Type::HashOf[Courier::UserRecipient::Preferences::Category] },
                 nil?: true

        # @!attribute template_id
        #
        #   @return [String, nil]
        optional :template_id, String, api_name: :templateId, nil?: true

        # @!method initialize(notifications:, categories: nil, template_id: nil)
        #   @param notifications [Hash{Symbol=>Courier::Models::UserRecipient::Preferences::Notification}]
        #   @param categories [Hash{Symbol=>Courier::Models::UserRecipient::Preferences::Category}, nil]
        #   @param template_id [String, nil]

        class Notification < Courier::Internal::Type::BaseModel
          # @!attribute status
          #
          #   @return [Symbol, Courier::Models::Users::PreferenceStatus]
          required :status, enum: -> { Courier::Users::PreferenceStatus }

          # @!attribute channel_preferences
          #
          #   @return [Array<Courier::Models::UserRecipient::Preferences::Notification::ChannelPreference>, nil]
          optional :channel_preferences,
                   -> {
                     Courier::Internal::Type::ArrayOf[Courier::UserRecipient::Preferences::Notification::ChannelPreference]
                   },
                   nil?: true

          # @!attribute rules
          #
          #   @return [Array<Courier::Models::UserRecipient::Preferences::Notification::Rule>, nil]
          optional :rules,
                   -> {
                     Courier::Internal::Type::ArrayOf[Courier::UserRecipient::Preferences::Notification::Rule]
                   },
                   nil?: true

          # @!attribute source
          #
          #   @return [Symbol, Courier::Models::UserRecipient::Preferences::Notification::Source, nil]
          optional :source, enum: -> { Courier::UserRecipient::Preferences::Notification::Source }, nil?: true

          # @!method initialize(status:, channel_preferences: nil, rules: nil, source: nil)
          #   @param status [Symbol, Courier::Models::Users::PreferenceStatus]
          #   @param channel_preferences [Array<Courier::Models::UserRecipient::Preferences::Notification::ChannelPreference>, nil]
          #   @param rules [Array<Courier::Models::UserRecipient::Preferences::Notification::Rule>, nil]
          #   @param source [Symbol, Courier::Models::UserRecipient::Preferences::Notification::Source, nil]

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

          # @see Courier::Models::UserRecipient::Preferences::Notification#source
          module Source
            extend Courier::Internal::Type::Enum

            SUBSCRIPTION = :subscription
            LIST = :list
            RECIPIENT = :recipient

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        class Category < Courier::Internal::Type::BaseModel
          # @!attribute status
          #
          #   @return [Symbol, Courier::Models::Users::PreferenceStatus]
          required :status, enum: -> { Courier::Users::PreferenceStatus }

          # @!attribute channel_preferences
          #
          #   @return [Array<Courier::Models::UserRecipient::Preferences::Category::ChannelPreference>, nil]
          optional :channel_preferences,
                   -> {
                     Courier::Internal::Type::ArrayOf[Courier::UserRecipient::Preferences::Category::ChannelPreference]
                   },
                   nil?: true

          # @!attribute rules
          #
          #   @return [Array<Courier::Models::UserRecipient::Preferences::Category::Rule>, nil]
          optional :rules,
                   -> {
                     Courier::Internal::Type::ArrayOf[Courier::UserRecipient::Preferences::Category::Rule]
                   },
                   nil?: true

          # @!attribute source
          #
          #   @return [Symbol, Courier::Models::UserRecipient::Preferences::Category::Source, nil]
          optional :source, enum: -> { Courier::UserRecipient::Preferences::Category::Source }, nil?: true

          # @!method initialize(status:, channel_preferences: nil, rules: nil, source: nil)
          #   @param status [Symbol, Courier::Models::Users::PreferenceStatus]
          #   @param channel_preferences [Array<Courier::Models::UserRecipient::Preferences::Category::ChannelPreference>, nil]
          #   @param rules [Array<Courier::Models::UserRecipient::Preferences::Category::Rule>, nil]
          #   @param source [Symbol, Courier::Models::UserRecipient::Preferences::Category::Source, nil]

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

          # @see Courier::Models::UserRecipient::Preferences::Category#source
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
  end
end
