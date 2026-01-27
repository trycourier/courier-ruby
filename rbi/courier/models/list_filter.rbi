# typed: strong

module Courier
  module Models
    class ListFilter < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Courier::ListFilter, Courier::Internal::AnyHash) }

      # Send to users only if they are member of the account
      sig { returns(Courier::ListFilter::Operator::OrSymbol) }
      attr_accessor :operator

      sig { returns(Courier::ListFilter::Path::OrSymbol) }
      attr_accessor :path

      sig { returns(String) }
      attr_accessor :value

      sig do
        params(
          operator: Courier::ListFilter::Operator::OrSymbol,
          path: Courier::ListFilter::Path::OrSymbol,
          value: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Send to users only if they are member of the account
        operator:,
        path:,
        value:
      )
      end

      sig do
        override.returns(
          {
            operator: Courier::ListFilter::Operator::OrSymbol,
            path: Courier::ListFilter::Path::OrSymbol,
            value: String
          }
        )
      end
      def to_hash
      end

      # Send to users only if they are member of the account
      module Operator
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Courier::ListFilter::Operator) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        MEMBER_OF =
          T.let(:MEMBER_OF, Courier::ListFilter::Operator::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Courier::ListFilter::Operator::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      module Path
        extend Courier::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Courier::ListFilter::Path) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ACCOUNT_ID = T.let(:account_id, Courier::ListFilter::Path::TaggedSymbol)

        sig do
          override.returns(T::Array[Courier::ListFilter::Path::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
