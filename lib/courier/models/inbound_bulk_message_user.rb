# frozen_string_literal: true

module Courier
  module Models
    class InboundBulkMessageUser < Courier::Internal::Type::BaseModel
      # @!attribute data
      #   User-specific data that will be merged with message.data
      #
      #   @return [Object, nil]
      optional :data, Courier::Internal::Type::Unknown

      # @!attribute preferences
      #
      #   @return [Courier::Models::RecipientPreferences, nil]
      optional :preferences, -> { Courier::RecipientPreferences }, nil?: true

      # @!attribute profile
      #   User profile information. For email-based bulk jobs, `profile.email` is required
      #   for provider routing to determine if the message can be delivered. The email
      #   address should be provided here rather than in `to.email`.
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :profile, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown], nil?: true

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
      #   @return [Courier::Models::UserRecipient, nil]
      optional :to, -> { Courier::UserRecipient }, nil?: true

      # @!method initialize(data: nil, preferences: nil, profile: nil, recipient: nil, to: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::InboundBulkMessageUser} for more details.
      #
      #   @param data [Object] User-specific data that will be merged with message.data
      #
      #   @param preferences [Courier::Models::RecipientPreferences, nil]
      #
      #   @param profile [Hash{Symbol=>Object}, nil] User profile information. For email-based bulk jobs, `profile.email` is required
      #
      #   @param recipient [String, nil] User ID (legacy field, use profile or to.user_id instead)
      #
      #   @param to [Courier::Models::UserRecipient, nil] Optional recipient information. Note: For email provider routing, use
    end
  end
end
