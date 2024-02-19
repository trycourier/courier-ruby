# frozen_string_literal: true

module Courier
  class Audiences
    # @type [COMPARISON_OPERATOR]
    COMPARISON_OPERATOR = {
      ends_with: "ENDS_WITH",
      eq: "EQ",
      exists: "EXISTS",
      gt: "GT",
      gte: "GTE",
      includes: "INCLUDES",
      is_after: "IS_AFTER",
      is_before: "IS_BEFORE",
      lt: "LT",
      lte: "LTE",
      neq: "NEQ",
      omit: "OMIT",
      starts_with: "STARTS_WITH"
    }.freeze
  end
end
