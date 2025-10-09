# frozen_string_literal: true

module Trycourier
  module Models
    class InboundBulkMessageUser < Trycourier::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Object, nil]
      optional :data, Trycourier::Internal::Type::Unknown

      # @!attribute preferences
      #
      #   @return [Trycourier::Models::RecipientPreferences, nil]
      optional :preferences, -> { Trycourier::RecipientPreferences }, nil?: true

      # @!attribute profile
      #
      #   @return [Object, nil]
      optional :profile, Trycourier::Internal::Type::Unknown

      # @!attribute recipient
      #
      #   @return [String, nil]
      optional :recipient, String, nil?: true

      # @!attribute to
      #
      #   @return [Trycourier::Models::UserRecipient, nil]
      optional :to, -> { Trycourier::UserRecipient }, nil?: true

      # @!method initialize(data: nil, preferences: nil, profile: nil, recipient: nil, to: nil)
      #   @param data [Object]
      #   @param preferences [Trycourier::Models::RecipientPreferences, nil]
      #   @param profile [Object]
      #   @param recipient [String, nil]
      #   @param to [Trycourier::Models::UserRecipient, nil]
    end
  end
end
