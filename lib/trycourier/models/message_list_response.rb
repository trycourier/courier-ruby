# frozen_string_literal: true

module Trycourier
  module Models
    # @see Trycourier::Resources::Messages#list
    class MessageListResponse < Trycourier::Internal::Type::BaseModel
      # @!attribute paging
      #   Paging information for the result set.
      #
      #   @return [Trycourier::Models::Paging]
      required :paging, -> { Trycourier::Paging }

      # @!attribute results
      #   An array of messages with their details.
      #
      #   @return [Array<Trycourier::Models::MessageDetails>]
      required :results, -> { Trycourier::Internal::Type::ArrayOf[Trycourier::MessageDetails] }

      # @!method initialize(paging:, results:)
      #   @param paging [Trycourier::Models::Paging] Paging information for the result set.
      #
      #   @param results [Array<Trycourier::Models::MessageDetails>] An array of messages with their details.
    end
  end
end
