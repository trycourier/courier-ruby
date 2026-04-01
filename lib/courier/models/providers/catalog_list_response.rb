# frozen_string_literal: true

module Courier
  module Models
    module Providers
      # @see Courier::Resources::Providers::Catalog#list
      class CatalogListResponse < Courier::Internal::Type::BaseModel
        # @!attribute paging
        #
        #   @return [Courier::Models::Paging]
        required :paging, -> { Courier::Paging }

        # @!attribute results
        #
        #   @return [Array<Courier::Models::ProvidersCatalogEntry>]
        required :results, -> { Courier::Internal::Type::ArrayOf[Courier::ProvidersCatalogEntry] }

        # @!method initialize(paging:, results:)
        #   Paginated list of available provider types with their configuration schemas.
        #
        #   @param paging [Courier::Models::Paging]
        #   @param results [Array<Courier::Models::ProvidersCatalogEntry>]
      end
    end
  end
end
