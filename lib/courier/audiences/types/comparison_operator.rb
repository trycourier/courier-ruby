# frozen_string_literal: true

module Courier
  module Audiences
    module Types
      module ComparisonOperator
        extend Courier::Internal::Types::Enum

        ENDS_WITH = "ENDS_WITH"
        EQ = "EQ"
        EXISTS = "EXISTS"
        GT = "GT"
        GTE = "GTE"
        INCLUDES = "INCLUDES"
        IS_AFTER = "IS_AFTER"
        IS_BEFORE = "IS_BEFORE"
        LT = "LT"
        LTE = "LTE"
        NEQ = "NEQ"
        OMIT = "OMIT"
        STARTS_WITH = "STARTS_WITH"
      end
    end
  end
end
