# frozen_string_literal: true

module Trycourier
  module Models
    class NestedFilterConfig < Trycourier::Internal::Type::BaseModel
      # @!attribute filters
      #
      #   @return [Array<Trycourier::Models::FilterConfig>]
      required :filters, -> { Trycourier::Internal::Type::ArrayOf[union: Trycourier::FilterConfig] }

      # @!attribute operator
      #   The operator to use for filtering
      #
      #   @return [Symbol, Trycourier::Models::NestedFilterConfig::Operator]
      required :operator, enum: -> { Trycourier::NestedFilterConfig::Operator }

      # @!method initialize(filters:, operator:)
      #   @param filters [Array<Trycourier::Models::FilterConfig>]
      #
      #   @param operator [Symbol, Trycourier::Models::NestedFilterConfig::Operator] The operator to use for filtering

      # The operator to use for filtering
      #
      # @see Trycourier::Models::NestedFilterConfig#operator
      module Operator
        extend Trycourier::Internal::Type::Enum

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
