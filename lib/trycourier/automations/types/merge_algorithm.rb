# frozen_string_literal: true

module Courier
  class Automations
    # @type [MERGE_ALGORITHM]
    MERGE_ALGORITHM = { replace: "replace", none: "none", overwrite: "overwrite", soft_merge: "soft-merge" }.freeze
  end
end
