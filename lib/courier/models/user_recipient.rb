# frozen_string_literal: true

module Courier
  module Models
    class UserRecipient < Courier::Internal::Type::BaseModel
      # @!attribute account_id
      #   Deprecated - Use `tenant_id` instead.
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
      #   The user's email address.
      #
      #   @return [String, nil]
      optional :email, String, nil?: true

      # @!attribute list_id
      #   The id of the list to send the message to.
      #
      #   @return [String, nil]
      optional :list_id, String, nil?: true

      # @!attribute locale
      #   The user's preferred ISO 639-1 language code.
      #
      #   @return [String, nil]
      optional :locale, String, nil?: true

      # @!attribute phone_number
      #   The user's phone number.
      #
      #   @return [String, nil]
      optional :phone_number, String, nil?: true

      # @!attribute preferences
      #
      #   @return [Courier::Models::UserRecipient::Preferences, nil]
      optional :preferences, -> { Courier::UserRecipient::Preferences }, nil?: true

      # @!attribute tenant_id
      #   The id of the tenant the user is associated with.
      #
      #   @return [String, nil]
      optional :tenant_id, String, nil?: true

      # @!attribute user_id
      #   The user's unique identifier. Typically, this will match the user id of a user
      #   in your system.
      #
      #   @return [String, nil]
      optional :user_id, String, nil?: true

      # @!method initialize(account_id: nil, context: nil, data: nil, email: nil, list_id: nil, locale: nil, phone_number: nil, preferences: nil, tenant_id: nil, user_id: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::UserRecipient} for more details.
      #
      #   @param account_id [String, nil] Deprecated - Use `tenant_id` instead.
      #
      #   @param context [Courier::Models::MessageContext, nil] Context such as tenant_id to send the notification with.
      #
      #   @param data [Hash{Symbol=>Object}, nil]
      #
      #   @param email [String, nil] The user's email address.
      #
      #   @param list_id [String, nil] The id of the list to send the message to.
      #
      #   @param locale [String, nil] The user's preferred ISO 639-1 language code.
      #
      #   @param phone_number [String, nil] The user's phone number.
      #
      #   @param preferences [Courier::Models::UserRecipient::Preferences, nil]
      #
      #   @param tenant_id [String, nil] The id of the tenant the user is associated with.
      #
      #   @param user_id [String, nil] The user's unique identifier. Typically, this will match the user id of a user i

      # @see Courier::Models::UserRecipient#preferences
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
