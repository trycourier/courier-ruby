# frozen_string_literal: true

module Trycourier
  module Models
    class FilterConfig < Trycourier::Internal::Type::BaseModel
      # @!attribute operator
      #   The operator to use for filtering
      #
      #   @return [Symbol, Trycourier::Models::FilterConfig::Operator]
      required :operator, enum: -> { Trycourier::FilterConfig::Operator }

      # @!attribute path
      #   The attribe name from profile whose value will be operated against the filter
      #   value
      #
      #   @return [String]
      required :path, String

      # @!attribute value
      #   The value to use for filtering
      #
      #   @return [String]
      required :value, String

      # @!method initialize(operator:, path:, value:)
      #   Some parameter documentations has been truncated, see
      #   {Trycourier::Models::FilterConfig} for more details.
      #
      #   @param operator [Symbol, Trycourier::Models::FilterConfig::Operator] The operator to use for filtering
      #
      #   @param path [String] The attribe name from profile whose value will be operated against the filter va
      #
      #   @param value [String] The value to use for filtering

      # The operator to use for filtering
      #
      # @see Trycourier::Models::FilterConfig#operator
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
