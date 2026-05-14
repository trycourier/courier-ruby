# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Journeys#list_versions
    class JourneyVersionsListResponse < Courier::Internal::Type::BaseModel
      # @!attribute paging
      #
      #   @return [Courier::Models::Paging]
      required :paging, -> { Courier::Paging }

      # @!attribute results
      #
      #   @return [Array<Courier::Models::JourneyVersionItem>]
      required :results, -> { Courier::Internal::Type::ArrayOf[Courier::JourneyVersionItem] }

      # @!method initialize(paging:, results:)
      #   @param paging [Courier::Models::Paging]
      #   @param results [Array<Courier::Models::JourneyVersionItem>]
    end
  end
end
