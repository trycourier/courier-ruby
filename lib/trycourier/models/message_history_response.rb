# frozen_string_literal: true

module Trycourier
  module Models
    # @see Trycourier::Resources::Messages#history
    class MessageHistoryResponse < Trycourier::Internal::Type::BaseModel
      # @!attribute results
      #
      #   @return [Array<Hash{Symbol=>Object}>]
      required :results,
               Trycourier::Internal::Type::ArrayOf[Trycourier::Internal::Type::HashOf[Trycourier::Internal::Type::Unknown]]

      # @!method initialize(results:)
      #   @param results [Array<Hash{Symbol=>Object}>]
    end
  end
end
