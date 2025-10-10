# frozen_string_literal: true

module Trycourier
  module Models
    class PutSubscriptionsRecipient < Trycourier::Internal::Type::BaseModel
      # @!attribute recipient_id
      #
      #   @return [String]
      required :recipient_id, String, api_name: :recipientId

      # @!attribute preferences
      #
      #   @return [Trycourier::Models::RecipientPreferences, nil]
      optional :preferences, -> { Trycourier::RecipientPreferences }, nil?: true

      # @!method initialize(recipient_id:, preferences: nil)
      #   @param recipient_id [String]
      #   @param preferences [Trycourier::Models::RecipientPreferences, nil]
    end
  end
end
