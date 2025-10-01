# frozen_string_literal: true

module Courier
  module Models
    class DefaultPreferences < Courier::Internal::Type::BaseModel
      # @!attribute items
      #
      #   @return [Array<Courier::Models::DefaultPreferences::Item>, nil]
      optional :items, -> { Courier::Internal::Type::ArrayOf[Courier::DefaultPreferences::Item] }, nil?: true

      # @!method initialize(items: nil)
      #   @param items [Array<Courier::Models::DefaultPreferences::Item>, nil]

      class Item < Courier::Models::Tenants::DefaultPreferences::SubscriptionTopicNew
        # @!attribute id
        #   Topic ID
        #
        #   @return [String]
        required :id, String

        # @!method initialize(id:)
        #   @param id [String] Topic ID
      end
    end
  end
end
