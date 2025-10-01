# frozen_string_literal: true

module Courier
  module Models
    # The operator to use for filtering
    module Filter
      extend Courier::Internal::Type::Union

      variant -> { Courier::Filter::UnionMember0 }

      # The operator to use for filtering
      variant -> { Courier::NestedFilterConfig }

      class UnionMember0 < Courier::Internal::Type::BaseModel
        # @!attribute operator
        #   The operator to use for filtering
        #
        #   @return [Symbol, Courier::Models::Filter::UnionMember0::Operator]
        required :operator, enum: -> { Courier::Filter::UnionMember0::Operator }

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
        #   {Courier::Models::Filter::UnionMember0} for more details.
        #
        #   @param operator [Symbol, Courier::Models::Filter::UnionMember0::Operator] The operator to use for filtering
        #
        #   @param path [String] The attribe name from profile whose value will be operated against the filter va
        #
        #   @param value [String] The value to use for filtering

        # The operator to use for filtering
        #
        # @see Courier::Models::Filter::UnionMember0#operator
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

      # @!method self.variants
      #   @return [Array(Courier::Models::Filter::UnionMember0, Courier::Models::NestedFilterConfig)]
    end
  end
end
