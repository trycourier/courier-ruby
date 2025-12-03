# frozen_string_literal: true

module Trycourier
  module Models
    class Recipient < Trycourier::Internal::Type::BaseModel
      # @!attribute account_id
      #   Deprecated - Use `tenant_id` instead.
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
      #   @return [Trycourier::Models::ProfilePreferences, nil]
      optional :preferences, -> { Trycourier::ProfilePreferences }, nil?: true

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
      #   {Trycourier::Models::Recipient} for more details.
      #
      #   @param account_id [String, nil] Deprecated - Use `tenant_id` instead.
      #
      #   @param context [Trycourier::Models::MessageContext, nil] Context such as tenant_id to send the notification with.
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
      #   @param preferences [Trycourier::Models::ProfilePreferences, nil]
      #
      #   @param tenant_id [String, nil] The id of the tenant the user is associated with.
      #
      #   @param user_id [String, nil] The user's unique identifier. Typically, this will match the user id of a user i
    end
  end
end
