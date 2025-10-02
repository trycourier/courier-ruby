# frozen_string_literal: true

module Courier
  module Audiences
    module Types
      module LogicalOperator
        extend Courier::Internal::Types::Enum

        AND = "AND"
        OR = "OR"
      end
    end
  end
end
