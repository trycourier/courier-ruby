# frozen_string_literal: true

module Courier
  module Automations
    module Types
      module MergeAlgorithm
        extend Courier::Internal::Types::Enum

        REPLACE = "replace"
        NONE = "none"
        OVERWRITE = "overwrite"
        SOFT_MERGE = "soft-merge"
      end
    end
  end
end
