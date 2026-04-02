# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Providers#list
    class ProviderListResponse < Courier::Internal::Type::BaseModel
      # @!attribute paging
      #
      #   @return [Courier::Models::Paging]
      required :paging, -> { Courier::Paging }

      # @!attribute results
      #
      #   @return [Array<Courier::Models::Provider>]
      required :results, -> { Courier::Internal::Type::ArrayOf[Courier::Provider] }

      # @!method initialize(paging:, results:)
      #   Paginated list of provider configurations.
      #
      #   @param paging [Courier::Models::Paging]
      #   @param results [Array<Courier::Models::Provider>]
    end
  end
end
