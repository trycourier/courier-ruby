# frozen_string_literal: true

module Courier
  module Models
    class Recipient < Courier::Internal::Type::BaseModel
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
      #   @return [Courier::Models::Recipient::Preferences, nil]
      optional :preferences, -> { Courier::Recipient::Preferences }, nil?: true

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
      #   @param preferences [Courier::Models::Recipient::Preferences, nil]
      #
      #   @param tenant_id [String, nil] Tenant id. Will load brand, default preferences and base context data.
      #
      #   @param user_id [String, nil]

      # @see Courier::Models::Recipient#preferences
      class Preferences < Courier::Internal::Type::BaseModel
        # @!attribute notifications
        #
        #   @return [Hash{Symbol=>Courier::Models::Preference}]
        required :notifications, -> { Courier::Internal::Type::HashOf[Courier::Preference] }

        # @!attribute categories
        #
        #   @return [Hash{Symbol=>Courier::Models::Preference}, nil]
        optional :categories, -> { Courier::Internal::Type::HashOf[Courier::Preference] }, nil?: true

        # @!attribute template_id
        #
        #   @return [String, nil]
        optional :template_id, String, api_name: :templateId, nil?: true

        # @!method initialize(notifications:, categories: nil, template_id: nil)
        #   @param notifications [Hash{Symbol=>Courier::Models::Preference}]
        #   @param categories [Hash{Symbol=>Courier::Models::Preference}, nil]
        #   @param template_id [String, nil]
      end
    end
  end
end
