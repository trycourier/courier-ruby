# typed: strong

module Courier
  module Models
    class FilterConfig < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::FilterConfig, Courier::Internal::AnyHash)
        end

      # The operator to use for filtering
      sig { returns(Courier::FilterConfig::Operator::OrSymbol) }
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
          operator: Courier::FilterConfig::Operator::OrSymbol,
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
            operator: Courier::FilterConfig::Operator::OrSymbol,
            path: String,
            value: String
          }
        )
      end
      def to_hash
      end

      # The operator to use for filtering
      module Operator
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Courier::FilterConfig::Operator) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ENDS_WITH =
          T.let(:ENDS_WITH, Courier::FilterConfig::Operator::TaggedSymbol)
        EQ = T.let(:EQ, Courier::FilterConfig::Operator::TaggedSymbol)
        EXISTS = T.let(:EXISTS, Courier::FilterConfig::Operator::TaggedSymbol)
        GT = T.let(:GT, Courier::FilterConfig::Operator::TaggedSymbol)
        GTE = T.let(:GTE, Courier::FilterConfig::Operator::TaggedSymbol)
        INCLUDES =
          T.let(:INCLUDES, Courier::FilterConfig::Operator::TaggedSymbol)
        IS_AFTER =
          T.let(:IS_AFTER, Courier::FilterConfig::Operator::TaggedSymbol)
        IS_BEFORE =
          T.let(:IS_BEFORE, Courier::FilterConfig::Operator::TaggedSymbol)
        LT = T.let(:LT, Courier::FilterConfig::Operator::TaggedSymbol)
        LTE = T.let(:LTE, Courier::FilterConfig::Operator::TaggedSymbol)
        NEQ = T.let(:NEQ, Courier::FilterConfig::Operator::TaggedSymbol)
        OMIT = T.let(:OMIT, Courier::FilterConfig::Operator::TaggedSymbol)
        STARTS_WITH =
          T.let(:STARTS_WITH, Courier::FilterConfig::Operator::TaggedSymbol)
        AND = T.let(:AND, Courier::FilterConfig::Operator::TaggedSymbol)
        OR = T.let(:OR, Courier::FilterConfig::Operator::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Courier::FilterConfig::Operator::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
