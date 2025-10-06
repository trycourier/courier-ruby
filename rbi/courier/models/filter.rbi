# typed: strong

module Courier
  module Models
    # The operator to use for filtering
    module Filter
      extend Courier::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(Courier::Filter::UnionMember0, Courier::NestedFilterConfig)
        end

      class UnionMember0 < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Courier::Filter::UnionMember0, Courier::Internal::AnyHash)
          end

        # The operator to use for filtering
        sig { returns(Courier::Filter::UnionMember0::Operator::OrSymbol) }
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
            operator: Courier::Filter::UnionMember0::Operator::OrSymbol,
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
              operator: Courier::Filter::UnionMember0::Operator::OrSymbol,
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
            T.type_alias do
              T.all(Symbol, Courier::Filter::UnionMember0::Operator)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ENDS_WITH =
            T.let(
              :ENDS_WITH,
              Courier::Filter::UnionMember0::Operator::TaggedSymbol
            )
          EQ = T.let(:EQ, Courier::Filter::UnionMember0::Operator::TaggedSymbol)
          EXISTS =
            T.let(
              :EXISTS,
              Courier::Filter::UnionMember0::Operator::TaggedSymbol
            )
          GT = T.let(:GT, Courier::Filter::UnionMember0::Operator::TaggedSymbol)
          GTE =
            T.let(:GTE, Courier::Filter::UnionMember0::Operator::TaggedSymbol)
          INCLUDES =
            T.let(
              :INCLUDES,
              Courier::Filter::UnionMember0::Operator::TaggedSymbol
            )
          IS_AFTER =
            T.let(
              :IS_AFTER,
              Courier::Filter::UnionMember0::Operator::TaggedSymbol
            )
          IS_BEFORE =
            T.let(
              :IS_BEFORE,
              Courier::Filter::UnionMember0::Operator::TaggedSymbol
            )
          LT = T.let(:LT, Courier::Filter::UnionMember0::Operator::TaggedSymbol)
          LTE =
            T.let(:LTE, Courier::Filter::UnionMember0::Operator::TaggedSymbol)
          NEQ =
            T.let(:NEQ, Courier::Filter::UnionMember0::Operator::TaggedSymbol)
          OMIT =
            T.let(:OMIT, Courier::Filter::UnionMember0::Operator::TaggedSymbol)
          STARTS_WITH =
            T.let(
              :STARTS_WITH,
              Courier::Filter::UnionMember0::Operator::TaggedSymbol
            )
          AND =
            T.let(:AND, Courier::Filter::UnionMember0::Operator::TaggedSymbol)
          OR = T.let(:OR, Courier::Filter::UnionMember0::Operator::TaggedSymbol)

          sig do
            override.returns(
              T::Array[Courier::Filter::UnionMember0::Operator::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end

      sig { override.returns(T::Array[Courier::Filter::Variants]) }
      def self.variants
      end
    end
  end
end
