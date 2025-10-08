# frozen_string_literal: true

module Courier
  module Models
    class PutSubscriptionsRecipient < Courier::Internal::Type::BaseModel
      # @!attribute recipient_id
      #
      #   @return [String]
      required :recipient_id, String, api_name: :recipientId

      # @!attribute preferences
      #
      #   @return [Courier::Models::RecipientPreferences, nil]
      optional :preferences, -> { Courier::RecipientPreferences }, nil?: true

      # @!method initialize(recipient_id:, preferences: nil)
      #   @param recipient_id [String]
      #   @param preferences [Courier::Models::RecipientPreferences, nil]
    end
  end
end
