# typed: strong

module Courier
  module Models
    class NestedFilterConfig < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::NestedFilterConfig, Courier::Internal::AnyHash)
        end

      # The operator to use for filtering
      sig { returns(Courier::NestedFilterConfig::Operator::OrSymbol) }
      attr_accessor :operator

      sig { returns(T::Array[Courier::FilterConfig]) }
      attr_accessor :rules

      sig do
        params(
          operator: Courier::NestedFilterConfig::Operator::OrSymbol,
          rules: T::Array[Courier::FilterConfig]
        ).returns(T.attached_class)
      end
      def self.new(
        # The operator to use for filtering
        operator:,
        rules:
      )
      end

      sig do
        override.returns(
          {
            operator: Courier::NestedFilterConfig::Operator::OrSymbol,
            rules: T::Array[Courier::FilterConfig]
          }
        )
      end
      def to_hash
      end

      # The operator to use for filtering
      module Operator
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Courier::NestedFilterConfig::Operator) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ENDS_WITH =
          T.let(:ENDS_WITH, Courier::NestedFilterConfig::Operator::TaggedSymbol)
        EQ = T.let(:EQ, Courier::NestedFilterConfig::Operator::TaggedSymbol)
        EXISTS =
          T.let(:EXISTS, Courier::NestedFilterConfig::Operator::TaggedSymbol)
        GT = T.let(:GT, Courier::NestedFilterConfig::Operator::TaggedSymbol)
        GTE = T.let(:GTE, Courier::NestedFilterConfig::Operator::TaggedSymbol)
        INCLUDES =
          T.let(:INCLUDES, Courier::NestedFilterConfig::Operator::TaggedSymbol)
        IS_AFTER =
          T.let(:IS_AFTER, Courier::NestedFilterConfig::Operator::TaggedSymbol)
        IS_BEFORE =
          T.let(:IS_BEFORE, Courier::NestedFilterConfig::Operator::TaggedSymbol)
        LT = T.let(:LT, Courier::NestedFilterConfig::Operator::TaggedSymbol)
        LTE = T.let(:LTE, Courier::NestedFilterConfig::Operator::TaggedSymbol)
        NEQ = T.let(:NEQ, Courier::NestedFilterConfig::Operator::TaggedSymbol)
        OMIT = T.let(:OMIT, Courier::NestedFilterConfig::Operator::TaggedSymbol)
        STARTS_WITH =
          T.let(
            :STARTS_WITH,
            Courier::NestedFilterConfig::Operator::TaggedSymbol
          )
        AND = T.let(:AND, Courier::NestedFilterConfig::Operator::TaggedSymbol)
        OR = T.let(:OR, Courier::NestedFilterConfig::Operator::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Courier::NestedFilterConfig::Operator::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
