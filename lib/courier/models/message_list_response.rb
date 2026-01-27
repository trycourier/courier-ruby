# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Messages#list
    class MessageListResponse < Courier::Internal::Type::BaseModel
      # @!attribute paging
      #   Paging information for the result set.
      #
      #   @return [Courier::Models::Paging]
      required :paging, -> { Courier::Paging }

      # @!attribute results
      #   An array of messages with their details.
      #
      #   @return [Array<Courier::Models::MessageDetails>]
      required :results, -> { Courier::Internal::Type::ArrayOf[Courier::MessageDetails] }

      # @!method initialize(paging:, results:)
      #   @param paging [Courier::Models::Paging] Paging information for the result set.
      #
      #   @param results [Array<Courier::Models::MessageDetails>] An array of messages with their details.
    end
  end
end
