# frozen_string_literal: true

module Courier
  module Models
    # Strategy for merging a fetch response into the journey run state.
    module JourneyMergeStrategy
      extend Courier::Internal::Type::Enum

      OVERWRITE = :overwrite
      SOFT_MERGE = :"soft-merge"
      REPLACE = :replace
      NONE = :none

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
