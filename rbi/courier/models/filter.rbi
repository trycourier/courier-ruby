# typed: strong

module Courier
  module Models
    class Filter < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Courier::Filter, Courier::Internal::AnyHash) }

      # The operator to use for filtering
      sig { returns(Courier::Filter::Operator::OrSymbol) }
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
          operator: Courier::Filter::Operator::OrSymbol,
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
            operator: Courier::Filter::Operator::OrSymbol,
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

        TaggedSymbol = T.type_alias { T.all(Symbol, Courier::Filter::Operator) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ENDS_WITH = T.let(:ENDS_WITH, Courier::Filter::Operator::TaggedSymbol)
        EQ = T.let(:EQ, Courier::Filter::Operator::TaggedSymbol)
        EXISTS = T.let(:EXISTS, Courier::Filter::Operator::TaggedSymbol)
        GT = T.let(:GT, Courier::Filter::Operator::TaggedSymbol)
        GTE = T.let(:GTE, Courier::Filter::Operator::TaggedSymbol)
        INCLUDES = T.let(:INCLUDES, Courier::Filter::Operator::TaggedSymbol)
        IS_AFTER = T.let(:IS_AFTER, Courier::Filter::Operator::TaggedSymbol)
        IS_BEFORE = T.let(:IS_BEFORE, Courier::Filter::Operator::TaggedSymbol)
        LT = T.let(:LT, Courier::Filter::Operator::TaggedSymbol)
        LTE = T.let(:LTE, Courier::Filter::Operator::TaggedSymbol)
        NEQ = T.let(:NEQ, Courier::Filter::Operator::TaggedSymbol)
        OMIT = T.let(:OMIT, Courier::Filter::Operator::TaggedSymbol)
        STARTS_WITH =
          T.let(:STARTS_WITH, Courier::Filter::Operator::TaggedSymbol)
        AND = T.let(:AND, Courier::Filter::Operator::TaggedSymbol)
        OR = T.let(:OR, Courier::Filter::Operator::TaggedSymbol)

        sig do
          override.returns(T::Array[Courier::Filter::Operator::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
