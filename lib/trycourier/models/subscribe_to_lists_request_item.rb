# frozen_string_literal: true

module Trycourier
  module Models
    class SubscribeToListsRequestItem < Trycourier::Internal::Type::BaseModel
      # @!attribute list_id
      #
      #   @return [String]
      required :list_id, String, api_name: :listId

      # @!attribute preferences
      #
      #   @return [Trycourier::Models::RecipientPreferences, nil]
      optional :preferences, -> { Trycourier::RecipientPreferences }, nil?: true

      # @!method initialize(list_id:, preferences: nil)
      #   @param list_id [String]
      #   @param preferences [Trycourier::Models::RecipientPreferences, nil]
    end
  end
end
