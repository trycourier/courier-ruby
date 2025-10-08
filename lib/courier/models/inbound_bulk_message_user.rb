# frozen_string_literal: true

module Courier
  module Models
    class InboundBulkMessageUser < Courier::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Object, nil]
      optional :data, Courier::Internal::Type::Unknown

      # @!attribute preferences
      #
      #   @return [Courier::Models::RecipientPreferences, nil]
      optional :preferences, -> { Courier::RecipientPreferences }, nil?: true

      # @!attribute profile
      #
      #   @return [Object, nil]
      optional :profile, Courier::Internal::Type::Unknown

      # @!attribute recipient
      #
      #   @return [String, nil]
      optional :recipient, String, nil?: true

      # @!attribute to
      #
      #   @return [Courier::Models::UserRecipient, nil]
      optional :to, -> { Courier::UserRecipient }, nil?: true

      # @!method initialize(data: nil, preferences: nil, profile: nil, recipient: nil, to: nil)
      #   @param data [Object]
      #   @param preferences [Courier::Models::RecipientPreferences, nil]
      #   @param profile [Object]
      #   @param recipient [String, nil]
      #   @param to [Courier::Models::UserRecipient, nil]
    end
  end
end
