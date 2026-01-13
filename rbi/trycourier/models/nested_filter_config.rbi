# typed: strong

module Trycourier
  module Models
    class NestedFilterConfig < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::NestedFilterConfig, Trycourier::Internal::AnyHash)
        end

      sig { returns(T::Array[Trycourier::FilterConfig]) }
      attr_accessor :filters

      # The operator to use for filtering
      sig { returns(Trycourier::NestedFilterConfig::Operator::OrSymbol) }
      attr_accessor :operator

      sig do
        params(
          filters: T::Array[Trycourier::FilterConfig],
          operator: Trycourier::NestedFilterConfig::Operator::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        filters:,
        # The operator to use for filtering
        operator:
      )
      end

      sig do
        override.returns(
          {
            filters: T::Array[Trycourier::FilterConfig],
            operator: Trycourier::NestedFilterConfig::Operator::OrSymbol
          }
        )
      end
      def to_hash
      end

      # The operator to use for filtering
      module Operator
        extend Trycourier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Trycourier::NestedFilterConfig::Operator)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ENDS_WITH =
          T.let(
            :ENDS_WITH,
            Trycourier::NestedFilterConfig::Operator::TaggedSymbol
          )
        EQ = T.let(:EQ, Trycourier::NestedFilterConfig::Operator::TaggedSymbol)
        EXISTS =
          T.let(:EXISTS, Trycourier::NestedFilterConfig::Operator::TaggedSymbol)
        GT = T.let(:GT, Trycourier::NestedFilterConfig::Operator::TaggedSymbol)
        GTE =
          T.let(:GTE, Trycourier::NestedFilterConfig::Operator::TaggedSymbol)
        INCLUDES =
          T.let(
            :INCLUDES,
            Trycourier::NestedFilterConfig::Operator::TaggedSymbol
          )
        IS_AFTER =
          T.let(
            :IS_AFTER,
            Trycourier::NestedFilterConfig::Operator::TaggedSymbol
          )
        IS_BEFORE =
          T.let(
            :IS_BEFORE,
            Trycourier::NestedFilterConfig::Operator::TaggedSymbol
          )
        LT = T.let(:LT, Trycourier::NestedFilterConfig::Operator::TaggedSymbol)
        LTE =
          T.let(:LTE, Trycourier::NestedFilterConfig::Operator::TaggedSymbol)
        NEQ =
          T.let(:NEQ, Trycourier::NestedFilterConfig::Operator::TaggedSymbol)
        OMIT =
          T.let(:OMIT, Trycourier::NestedFilterConfig::Operator::TaggedSymbol)
        STARTS_WITH =
          T.let(
            :STARTS_WITH,
            Trycourier::NestedFilterConfig::Operator::TaggedSymbol
          )
        AND =
          T.let(:AND, Trycourier::NestedFilterConfig::Operator::TaggedSymbol)
        OR = T.let(:OR, Trycourier::NestedFilterConfig::Operator::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Trycourier::NestedFilterConfig::Operator::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
