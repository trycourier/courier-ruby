# typed: strong

module Trycourier
  module Models
    class FilterConfig < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::FilterConfig, Trycourier::Internal::AnyHash)
        end

      # The operator for this filter. Use comparison operators (EQ, GT, LT, GTE, LTE,
      # NEQ, EXISTS, INCLUDES, STARTS_WITH, ENDS_WITH, IS_BEFORE, IS_AFTER, OMIT) for
      # single conditions, or logical operators (AND, OR) for nested filter groups.
      sig { returns(String) }
      attr_accessor :operator

      # Nested filter rules to combine with AND/OR. Required for nested filter groups,
      # not used for single filter conditions.
      sig { returns(T.nilable(T::Array[Trycourier::FilterConfig])) }
      attr_reader :filters

      sig { params(filters: T::Array[Trycourier::FilterConfig]).void }
      attr_writer :filters

      # The attribute path from the user profile to filter on. Required for single
      # filter conditions, not used for nested filter groups.
      sig { returns(T.nilable(String)) }
      attr_reader :path

      sig { params(path: String).void }
      attr_writer :path

      # The value to compare against. Required for single filter conditions, not used
      # for nested filter groups.
      sig { returns(T.nilable(String)) }
      attr_reader :value

      sig { params(value: String).void }
      attr_writer :value

      # A filter rule that can be either a single condition (with path/value) or a
      # nested group (with filters array). Use comparison operators (EQ, GT, etc.) for
      # single conditions, and logical operators (AND, OR) for nested groups.
      sig do
        params(
          operator: String,
          filters: T::Array[Trycourier::FilterConfig],
          path: String,
          value: String
        ).returns(T.attached_class)
      end
      def self.new(
        # The operator for this filter. Use comparison operators (EQ, GT, LT, GTE, LTE,
        # NEQ, EXISTS, INCLUDES, STARTS_WITH, ENDS_WITH, IS_BEFORE, IS_AFTER, OMIT) for
        # single conditions, or logical operators (AND, OR) for nested filter groups.
        operator:,
        # Nested filter rules to combine with AND/OR. Required for nested filter groups,
        # not used for single filter conditions.
        filters: nil,
        # The attribute path from the user profile to filter on. Required for single
        # filter conditions, not used for nested filter groups.
        path: nil,
        # The value to compare against. Required for single filter conditions, not used
        # for nested filter groups.
        value: nil
      )
      end

      sig do
        override.returns(
          {
            operator: String,
            filters: T::Array[Trycourier::FilterConfig],
            path: String,
            value: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
