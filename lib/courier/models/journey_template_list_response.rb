# frozen_string_literal: true

module Courier
  module Models
    class JourneyTemplateListResponse < Courier::Internal::Type::BaseModel
      # @!attribute paging
      #
      #   @return [Courier::Models::Paging]
      required :paging, -> { Courier::Paging }

      # @!attribute results
      #
      #   @return [Array<Courier::Models::JourneyTemplateSummary>]
      required :results, -> { Courier::Internal::Type::ArrayOf[Courier::JourneyTemplateSummary] }

      # @!method initialize(paging:, results:)
      #   @param paging [Courier::Models::Paging]
      #   @param results [Array<Courier::Models::JourneyTemplateSummary>]
    end
  end
end
