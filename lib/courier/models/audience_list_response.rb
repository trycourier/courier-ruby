# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Audiences#list
    class AudienceListResponse < Courier::Internal::Type::BaseModel
      # @!attribute items
      #
      #   @return [Array<Courier::Models::Audience>]
      required :items, -> { Courier::Internal::Type::ArrayOf[Courier::Audience] }

      # @!attribute paging
      #
      #   @return [Courier::Models::Paging]
      required :paging, -> { Courier::Paging }

      # @!method initialize(items:, paging:)
      #   @param items [Array<Courier::Models::Audience>]
      #   @param paging [Courier::Models::Paging]
    end
  end
end
