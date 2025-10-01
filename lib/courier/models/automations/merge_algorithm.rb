# frozen_string_literal: true

module Courier
  module Models
    module Automations
      module MergeAlgorithm
        extend Courier::Internal::Type::Enum

        REPLACE = :replace
        NONE = :none
        OVERWRITE = :overwrite
        SOFT_MERGE = :"soft-merge"

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
