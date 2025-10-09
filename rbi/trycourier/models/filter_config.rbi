# typed: strong

module Trycourier
  module Models
    class FilterConfig < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::FilterConfig, Trycourier::Internal::AnyHash)
        end

      # The operator to use for filtering
      sig { returns(Trycourier::FilterConfig::Operator::OrSymbol) }
      attr_accessor :operator

      # The attribe name from profile whose value will be operated against the filter
      # value
      sig { returns(String) }
      attr_accessor :path

      # The value to use for filtering
      sig { returns(String) }
      attr_accessor :value

      sig do
        params(
          operator: Trycourier::FilterConfig::Operator::OrSymbol,
          path: String,
          value: String
        ).returns(T.attached_class)
      end
      def self.new(
        # The operator to use for filtering
        operator:,
        # The attribe name from profile whose value will be operated against the filter
        # value
        path:,
        # The value to use for filtering
        value:
      )
      end

      sig do
        override.returns(
          {
            operator: Trycourier::FilterConfig::Operator::OrSymbol,
            path: String,
            value: String
          }
        )
      end
      def to_hash
      end

      # The operator to use for filtering
      module Operator
        extend Trycourier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Trycourier::FilterConfig::Operator) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ENDS_WITH =
          T.let(:ENDS_WITH, Trycourier::FilterConfig::Operator::TaggedSymbol)
        EQ = T.let(:EQ, Trycourier::FilterConfig::Operator::TaggedSymbol)
        EXISTS =
          T.let(:EXISTS, Trycourier::FilterConfig::Operator::TaggedSymbol)
        GT = T.let(:GT, Trycourier::FilterConfig::Operator::TaggedSymbol)
        GTE = T.let(:GTE, Trycourier::FilterConfig::Operator::TaggedSymbol)
        INCLUDES =
          T.let(:INCLUDES, Trycourier::FilterConfig::Operator::TaggedSymbol)
        IS_AFTER =
          T.let(:IS_AFTER, Trycourier::FilterConfig::Operator::TaggedSymbol)
        IS_BEFORE =
          T.let(:IS_BEFORE, Trycourier::FilterConfig::Operator::TaggedSymbol)
        LT = T.let(:LT, Trycourier::FilterConfig::Operator::TaggedSymbol)
        LTE = T.let(:LTE, Trycourier::FilterConfig::Operator::TaggedSymbol)
        NEQ = T.let(:NEQ, Trycourier::FilterConfig::Operator::TaggedSymbol)
        OMIT = T.let(:OMIT, Trycourier::FilterConfig::Operator::TaggedSymbol)
        STARTS_WITH =
          T.let(:STARTS_WITH, Trycourier::FilterConfig::Operator::TaggedSymbol)
        AND = T.let(:AND, Trycourier::FilterConfig::Operator::TaggedSymbol)
        OR = T.let(:OR, Trycourier::FilterConfig::Operator::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Trycourier::FilterConfig::Operator::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
