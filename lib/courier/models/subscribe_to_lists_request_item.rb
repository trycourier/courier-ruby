# frozen_string_literal: true

module Courier
  module Models
    class SubscribeToListsRequestItem < Courier::Internal::Type::BaseModel
      # @!attribute list_id
      #
      #   @return [String]
      required :list_id, String, api_name: :listId

      # @!attribute preferences
      #
      #   @return [Courier::Models::RecipientPreferences, nil]
      optional :preferences, -> { Courier::RecipientPreferences }, nil?: true

      # @!method initialize(list_id:, preferences: nil)
      #   @param list_id [String]
      #   @param preferences [Courier::Models::RecipientPreferences, nil]
    end
  end
end
