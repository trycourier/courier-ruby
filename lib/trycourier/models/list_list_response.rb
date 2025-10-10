# frozen_string_literal: true

module Trycourier
  module Models
    # @see Trycourier::Resources::Lists#list
    class ListListResponse < Trycourier::Internal::Type::BaseModel
      # @!attribute items
      #
      #   @return [Array<Trycourier::Models::SubscriptionList>]
      required :items, -> { Trycourier::Internal::Type::ArrayOf[Trycourier::SubscriptionList] }

      # @!attribute paging
      #
      #   @return [Trycourier::Models::Paging]
      required :paging, -> { Trycourier::Paging }

      # @!method initialize(items:, paging:)
      #   @param items [Array<Trycourier::Models::SubscriptionList>]
      #   @param paging [Trycourier::Models::Paging]
    end
  end
end
