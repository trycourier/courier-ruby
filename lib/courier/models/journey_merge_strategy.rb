# frozen_string_literal: true

module Courier
  module Models
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
