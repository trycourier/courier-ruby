# frozen_string_literal: true

module Trycourier
  module Models
    class FilterConfig < Trycourier::Internal::Type::BaseModel
      # @!attribute operator
      #   The operator for this filter. Use comparison operators (EQ, GT, LT, GTE, LTE,
      #   NEQ, EXISTS, INCLUDES, STARTS_WITH, ENDS_WITH, IS_BEFORE, IS_AFTER, OMIT) for
      #   single conditions, or logical operators (AND, OR) for nested filter groups.
      #
      #   @return [String]
      required :operator, String

      # @!attribute filters
      #   Nested filter rules to combine with AND/OR. Required for nested filter groups,
      #   not used for single filter conditions.
      #
      #   @return [Array<Trycourier::Models::FilterConfig>, nil]
      optional :filters, -> { Trycourier::Internal::Type::ArrayOf[Trycourier::FilterConfig] }

      # @!attribute path
      #   The attribute path from the user profile to filter on. Required for single
      #   filter conditions, not used for nested filter groups.
      #
      #   @return [String, nil]
      optional :path, String

      # @!attribute value
      #   The value to compare against. Required for single filter conditions, not used
      #   for nested filter groups.
      #
      #   @return [String, nil]
      optional :value, String

      # @!method initialize(operator:, filters: nil, path: nil, value: nil)
      #   Some parameter documentations has been truncated, see
      #   {Trycourier::Models::FilterConfig} for more details.
      #
      #   A filter rule that can be either a single condition (with path/value) or a
      #   nested group (with filters array). Use comparison operators (EQ, GT, etc.) for
      #   single conditions, and logical operators (AND, OR) for nested groups.
      #
      #   @param operator [String] The operator for this filter. Use comparison operators (EQ, GT, LT, GTE, LTE, N
      #
      #   @param filters [Array<Trycourier::Models::FilterConfig>] Nested filter rules to combine with AND/OR. Required for nested filter groups, n
      #
      #   @param path [String] The attribute path from the user profile to filter on. Required for single filt
      #
      #   @param value [String] The value to compare against. Required for single filter conditions, not used f
    end
  end
end
