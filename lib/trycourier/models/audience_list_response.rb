# frozen_string_literal: true

module Trycourier
  module Models
    # @see Trycourier::Resources::Audiences#list
    class AudienceListResponse < Trycourier::Internal::Type::BaseModel
      # @!attribute items
      #
      #   @return [Array<Trycourier::Models::Audience>]
      required :items, -> { Trycourier::Internal::Type::ArrayOf[Trycourier::Audience] }

      # @!attribute paging
      #
      #   @return [Trycourier::Models::Paging]
      required :paging, -> { Trycourier::Paging }

      # @!method initialize(items:, paging:)
      #   @param items [Array<Trycourier::Models::Audience>]
      #   @param paging [Trycourier::Models::Paging]
    end
  end
end
