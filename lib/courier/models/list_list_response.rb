# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Lists#list
    class ListListResponse < Courier::Internal::Type::BaseModel
      # @!attribute items
      #
      #   @return [Array<Courier::Models::SubscriptionList>]
      required :items, -> { Courier::Internal::Type::ArrayOf[Courier::SubscriptionList] }

      # @!attribute paging
      #
      #   @return [Courier::Models::Paging]
      required :paging, -> { Courier::Paging }

      # @!method initialize(items:, paging:)
      #   @param items [Array<Courier::Models::SubscriptionList>]
      #   @param paging [Courier::Models::Paging]
    end
  end
end
