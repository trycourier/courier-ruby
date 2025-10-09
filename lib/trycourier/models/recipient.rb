# frozen_string_literal: true

module Trycourier
  module Models
    class Recipient < Trycourier::Internal::Type::BaseModel
      # @!attribute account_id
      #   Use `tenant_id` instead.
      #
      #   @return [String, nil]
      optional :account_id, String, nil?: true

      # @!attribute context
      #   Context such as tenant_id to send the notification with.
      #
      #   @return [Trycourier::Models::MessageContext, nil]
      optional :context, -> { Trycourier::MessageContext }, nil?: true

      # @!attribute data
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :data, Trycourier::Internal::Type::HashOf[Trycourier::Internal::Type::Unknown], nil?: true

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
      #   @return [Trycourier::Models::Recipient::Preferences, nil]
      optional :preferences, -> { Trycourier::Recipient::Preferences }, nil?: true

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
      #   @param context [Trycourier::Models::MessageContext, nil] Context such as tenant_id to send the notification with.
      #
      #   @param data [Hash{Symbol=>Object}, nil]
      #
      #   @param email [String, nil]
      #
      #   @param locale [String, nil] The user's preferred ISO 639-1 language code.
      #
      #   @param phone_number [String, nil]
      #
      #   @param preferences [Trycourier::Models::Recipient::Preferences, nil]
      #
      #   @param tenant_id [String, nil] Tenant id. Will load brand, default preferences and base context data.
      #
      #   @param user_id [String, nil]

      # @see Trycourier::Models::Recipient#preferences
      class Preferences < Trycourier::Internal::Type::BaseModel
        # @!attribute notifications
        #
        #   @return [Hash{Symbol=>Trycourier::Models::Preference}]
        required :notifications, -> { Trycourier::Internal::Type::HashOf[Trycourier::Preference] }

        # @!attribute categories
        #
        #   @return [Hash{Symbol=>Trycourier::Models::Preference}, nil]
        optional :categories, -> { Trycourier::Internal::Type::HashOf[Trycourier::Preference] }, nil?: true

        # @!attribute template_id
        #
        #   @return [String, nil]
        optional :template_id, String, api_name: :templateId, nil?: true

        # @!method initialize(notifications:, categories: nil, template_id: nil)
        #   @param notifications [Hash{Symbol=>Trycourier::Models::Preference}]
        #   @param categories [Hash{Symbol=>Trycourier::Models::Preference}, nil]
        #   @param template_id [String, nil]
      end
    end
  end
end
