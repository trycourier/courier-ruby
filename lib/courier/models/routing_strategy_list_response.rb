# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::RoutingStrategies#list
    class RoutingStrategyListResponse < Courier::Internal::Type::BaseModel
      # @!attribute paging
      #
      #   @return [Courier::Models::Paging]
      required :paging, -> { Courier::Paging }

      # @!attribute results
      #
      #   @return [Array<Courier::Models::RoutingStrategySummary>]
      required :results, -> { Courier::Internal::Type::ArrayOf[Courier::RoutingStrategySummary] }

      # @!method initialize(paging:, results:)
      #   Paginated list of routing strategy summaries.
      #
      #   @param paging [Courier::Models::Paging]
      #   @param results [Array<Courier::Models::RoutingStrategySummary>]
    end
  end
end
