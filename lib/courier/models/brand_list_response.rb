# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Brands#list
    class BrandListResponse < Courier::Internal::Type::BaseModel
      # @!attribute paging
      #
      #   @return [Courier::Models::Paging]
      required :paging, -> { Courier::Paging }

      # @!attribute results
      #
      #   @return [Array<Courier::Models::Brand>]
      required :results, -> { Courier::Internal::Type::ArrayOf[Courier::Brand] }

      # @!method initialize(paging:, results:)
      #   @param paging [Courier::Models::Paging]
      #   @param results [Array<Courier::Models::Brand>]
    end
  end
end
