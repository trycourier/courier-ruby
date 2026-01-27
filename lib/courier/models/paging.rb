# frozen_string_literal: true

module Courier
  module Models
    class Paging < Courier::Internal::Type::BaseModel
      # @!attribute more
      #
      #   @return [Boolean]
      required :more, Courier::Internal::Type::Boolean

      # @!attribute cursor
      #
      #   @return [String, nil]
      optional :cursor, String, nil?: true

      # @!method initialize(more:, cursor: nil)
      #   @param more [Boolean]
      #   @param cursor [String, nil]
    end
  end
end
