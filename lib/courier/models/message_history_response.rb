# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Messages#history
    class MessageHistoryResponse < Courier::Internal::Type::BaseModel
      # @!attribute results
      #
      #   @return [Array<Hash{Symbol=>Object}>]
      required :results,
               Courier::Internal::Type::ArrayOf[Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown]]

      # @!method initialize(results:)
      #   @param results [Array<Hash{Symbol=>Object}>]
    end
  end
end
