# frozen_string_literal: true

module Trycourier
  module Models
    # @see Trycourier::Resources::Brands#list
    class BrandListResponse < Trycourier::Internal::Type::BaseModel
      # @!attribute paging
      #
      #   @return [Trycourier::Models::Paging]
      required :paging, -> { Trycourier::Paging }

      # @!attribute results
      #
      #   @return [Array<Trycourier::Models::Brand>]
      required :results, -> { Trycourier::Internal::Type::ArrayOf[Trycourier::Brand] }

      # @!method initialize(paging:, results:)
      #   @param paging [Trycourier::Models::Paging]
      #   @param results [Array<Trycourier::Models::Brand>]
    end
  end
end
