# typed: strong

module Trycourier
  module Models
    class Filter < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::Filter, Trycourier::Internal::AnyHash)
        end

      # The operator to use for filtering
      sig { returns(Trycourier::Filter::Operator::OrSymbol) }
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
          operator: Trycourier::Filter::Operator::OrSymbol,
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
            operator: Trycourier::Filter::Operator::OrSymbol,
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
          T.type_alias { T.all(Symbol, Trycourier::Filter::Operator) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ENDS_WITH =
          T.let(:ENDS_WITH, Trycourier::Filter::Operator::TaggedSymbol)
        EQ = T.let(:EQ, Trycourier::Filter::Operator::TaggedSymbol)
        EXISTS = T.let(:EXISTS, Trycourier::Filter::Operator::TaggedSymbol)
        GT = T.let(:GT, Trycourier::Filter::Operator::TaggedSymbol)
        GTE = T.let(:GTE, Trycourier::Filter::Operator::TaggedSymbol)
        INCLUDES = T.let(:INCLUDES, Trycourier::Filter::Operator::TaggedSymbol)
        IS_AFTER = T.let(:IS_AFTER, Trycourier::Filter::Operator::TaggedSymbol)
        IS_BEFORE =
          T.let(:IS_BEFORE, Trycourier::Filter::Operator::TaggedSymbol)
        LT = T.let(:LT, Trycourier::Filter::Operator::TaggedSymbol)
        LTE = T.let(:LTE, Trycourier::Filter::Operator::TaggedSymbol)
        NEQ = T.let(:NEQ, Trycourier::Filter::Operator::TaggedSymbol)
        OMIT = T.let(:OMIT, Trycourier::Filter::Operator::TaggedSymbol)
        STARTS_WITH =
          T.let(:STARTS_WITH, Trycourier::Filter::Operator::TaggedSymbol)
        AND = T.let(:AND, Trycourier::Filter::Operator::TaggedSymbol)
        OR = T.let(:OR, Trycourier::Filter::Operator::TaggedSymbol)

        sig do
          override.returns(T::Array[Trycourier::Filter::Operator::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
