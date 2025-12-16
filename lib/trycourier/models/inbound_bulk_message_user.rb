# frozen_string_literal: true

module Trycourier
  module Models
    class InboundBulkMessageUser < Trycourier::Internal::Type::BaseModel
      # @!attribute data
      #   User-specific data that will be merged with message.data
      #
      #   @return [Object, nil]
      optional :data, Trycourier::Internal::Type::Unknown

      # @!attribute preferences
      #
      #   @return [Trycourier::Models::RecipientPreferences, nil]
      optional :preferences, -> { Trycourier::RecipientPreferences }, nil?: true

      # @!attribute profile
      #   User profile information. For email-based bulk jobs, `profile.email` is required
      #   for provider routing to determine if the message can be delivered. The email
      #   address should be provided here rather than in `to.email`.
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :profile, Trycourier::Internal::Type::HashOf[Trycourier::Internal::Type::Unknown], nil?: true

      # @!attribute recipient
      #   User ID (legacy field, use profile or to.user_id instead)
      #
      #   @return [String, nil]
      optional :recipient, String, nil?: true

      # @!attribute to
      #   Optional recipient information. Note: For email provider routing, use
      #   `profile.email` instead of `to.email`. The `to` field is primarily used for
      #   recipient identification and data merging.
      #
      #   @return [Trycourier::Models::UserRecipient, nil]
      optional :to, -> { Trycourier::UserRecipient }, nil?: true

      # @!method initialize(data: nil, preferences: nil, profile: nil, recipient: nil, to: nil)
      #   Some parameter documentations has been truncated, see
      #   {Trycourier::Models::InboundBulkMessageUser} for more details.
      #
      #   @param data [Object] User-specific data that will be merged with message.data
      #
      #   @param preferences [Trycourier::Models::RecipientPreferences, nil]
      #
      #   @param profile [Hash{Symbol=>Object}, nil] User profile information. For email-based bulk jobs, `profile.email` is required
      #
      #   @param recipient [String, nil] User ID (legacy field, use profile or to.user_id instead)
      #
      #   @param to [Trycourier::Models::UserRecipient, nil] Optional recipient information. Note: For email provider routing, use
    end
  end
end
