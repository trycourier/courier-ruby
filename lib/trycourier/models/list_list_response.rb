# frozen_string_literal: true

module Trycourier
  module Models
    # @see Trycourier::Resources::Lists#list
    class ListListResponse < Trycourier::Internal::Type::BaseModel
      # @!attribute items
      #
      #   @return [Array<Trycourier::Models::UserList>]
      required :items, -> { Trycourier::Internal::Type::ArrayOf[Trycourier::UserList] }

      # @!attribute paging
      #
      #   @return [Trycourier::Models::Paging]
      required :paging, -> { Trycourier::Paging }

      # @!method initialize(items:, paging:)
      #   @param items [Array<Trycourier::Models::UserList>]
      #   @param paging [Trycourier::Models::Paging]
    end
  end
end
