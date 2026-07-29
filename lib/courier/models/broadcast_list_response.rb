# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Broadcasts#list
    class BroadcastListResponse < Courier::Internal::Type::BaseModel
      # @!attribute paging
      #
      #   @return [Courier::Models::Paging]
      required :paging, -> { Courier::Paging }

      # @!attribute results
      #
      #   @return [Array<Courier::Models::Broadcast>]
      required :results, -> { Courier::Internal::Type::ArrayOf[Courier::Broadcast] }

      # @!method initialize(paging:, results:)
      #   Paginated list of broadcasts.
      #
      #   @param paging [Courier::Models::Paging]
      #   @param results [Array<Courier::Models::Broadcast>]
    end
  end
end
