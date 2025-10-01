# frozen_string_literal: true

module Courier
  module Models
    class NestedFilterConfig < Courier::Internal::Type::BaseModel
      # @!attribute operator
      #   The operator to use for filtering
      #
      #   @return [Symbol, Courier::Models::NestedFilterConfig::Operator]
      required :operator, enum: -> { Courier::NestedFilterConfig::Operator }

      # @!attribute rules
      #
      #   @return [Array<Courier::Models::FilterConfig>]
      required :rules, -> { Courier::Internal::Type::ArrayOf[union: Courier::FilterConfig] }

      # @!method initialize(operator:, rules:)
      #   @param operator [Symbol, Courier::Models::NestedFilterConfig::Operator] The operator to use for filtering
      #
      #   @param rules [Array<Courier::Models::FilterConfig>]

      # The operator to use for filtering
      #
      # @see Courier::Models::NestedFilterConfig#operator
      module Operator
        extend Courier::Internal::Type::Enum

        ENDS_WITH = :ENDS_WITH
        EQ = :EQ
        EXISTS = :EXISTS
        GT = :GT
        GTE = :GTE
        INCLUDES = :INCLUDES
        IS_AFTER = :IS_AFTER
        IS_BEFORE = :IS_BEFORE
        LT = :LT
        LTE = :LTE
        NEQ = :NEQ
        OMIT = :OMIT
        STARTS_WITH = :STARTS_WITH
        AND = :AND
        OR = :OR

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
