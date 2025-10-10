# frozen_string_literal: true

module Trycourier
  module Models
    class UserRecipient < Trycourier::Internal::Type::BaseModel
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
      #   The user's email address.
      #
      #   @return [String, nil]
      optional :email, String, nil?: true

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
      #   @return [Trycourier::Models::UserRecipient::Preferences, nil]
      optional :preferences, -> { Trycourier::UserRecipient::Preferences }, nil?: true

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

      # @!method initialize(account_id: nil, context: nil, data: nil, email: nil, locale: nil, phone_number: nil, preferences: nil, tenant_id: nil, user_id: nil)
      #   Some parameter documentations has been truncated, see
      #   {Trycourier::Models::UserRecipient} for more details.
      #
      #   @param account_id [String, nil] Use `tenant_id` instead.
      #
      #   @param context [Trycourier::Models::MessageContext, nil] Context such as tenant_id to send the notification with.
      #
      #   @param data [Hash{Symbol=>Object}, nil]
      #
      #   @param email [String, nil] The user's email address.
      #
      #   @param locale [String, nil] The user's preferred ISO 639-1 language code.
      #
      #   @param phone_number [String, nil] The user's phone number.
      #
      #   @param preferences [Trycourier::Models::UserRecipient::Preferences, nil]
      #
      #   @param tenant_id [String, nil] The id of the tenant the user is associated with.
      #
      #   @param user_id [String, nil] The user's unique identifier. Typically, this will match the user id of a user i

      # @see Trycourier::Models::UserRecipient#preferences
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
