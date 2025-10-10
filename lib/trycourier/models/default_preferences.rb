# frozen_string_literal: true

module Trycourier
  module Models
    class DefaultPreferences < Trycourier::Internal::Type::BaseModel
      # @!attribute items
      #
      #   @return [Array<Trycourier::Models::DefaultPreferences::Item>, nil]
      optional :items,
               -> { Trycourier::Internal::Type::ArrayOf[Trycourier::DefaultPreferences::Item] },
               nil?: true

      # @!method initialize(items: nil)
      #   @param items [Array<Trycourier::Models::DefaultPreferences::Item>, nil]

      class Item < Trycourier::Models::SubscriptionTopicNew
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
