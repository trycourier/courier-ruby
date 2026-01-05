# typed: strong

module Trycourier
  module Models
    class SingleFilterConfig < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::SingleFilterConfig, Trycourier::Internal::AnyHash)
        end

      # The operator to use for filtering
      sig { returns(Trycourier::SingleFilterConfig::Operator::OrSymbol) }
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
          operator: Trycourier::SingleFilterConfig::Operator::OrSymbol,
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
            operator: Trycourier::SingleFilterConfig::Operator::OrSymbol,
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
          T.type_alias do
            T.all(Symbol, Trycourier::SingleFilterConfig::Operator)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ENDS_WITH =
          T.let(
            :ENDS_WITH,
            Trycourier::SingleFilterConfig::Operator::TaggedSymbol
          )
        EQ = T.let(:EQ, Trycourier::SingleFilterConfig::Operator::TaggedSymbol)
        EXISTS =
          T.let(:EXISTS, Trycourier::SingleFilterConfig::Operator::TaggedSymbol)
        GT = T.let(:GT, Trycourier::SingleFilterConfig::Operator::TaggedSymbol)
        GTE =
          T.let(:GTE, Trycourier::SingleFilterConfig::Operator::TaggedSymbol)
        INCLUDES =
          T.let(
            :INCLUDES,
            Trycourier::SingleFilterConfig::Operator::TaggedSymbol
          )
        IS_AFTER =
          T.let(
            :IS_AFTER,
            Trycourier::SingleFilterConfig::Operator::TaggedSymbol
          )
        IS_BEFORE =
          T.let(
            :IS_BEFORE,
            Trycourier::SingleFilterConfig::Operator::TaggedSymbol
          )
        LT = T.let(:LT, Trycourier::SingleFilterConfig::Operator::TaggedSymbol)
        LTE =
          T.let(:LTE, Trycourier::SingleFilterConfig::Operator::TaggedSymbol)
        NEQ =
          T.let(:NEQ, Trycourier::SingleFilterConfig::Operator::TaggedSymbol)
        OMIT =
          T.let(:OMIT, Trycourier::SingleFilterConfig::Operator::TaggedSymbol)
        STARTS_WITH =
          T.let(
            :STARTS_WITH,
            Trycourier::SingleFilterConfig::Operator::TaggedSymbol
          )
        AND =
          T.let(:AND, Trycourier::SingleFilterConfig::Operator::TaggedSymbol)
        OR = T.let(:OR, Trycourier::SingleFilterConfig::Operator::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Trycourier::SingleFilterConfig::Operator::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
