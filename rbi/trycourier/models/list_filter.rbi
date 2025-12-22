# typed: strong

module Trycourier
  module Models
    class ListFilter < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::ListFilter, Trycourier::Internal::AnyHash)
        end

      # Send to users only if they are member of the account
      sig { returns(Trycourier::ListFilter::Operator::OrSymbol) }
      attr_accessor :operator

      sig { returns(Trycourier::ListFilter::Path::OrSymbol) }
      attr_accessor :path

      sig { returns(String) }
      attr_accessor :value

      sig do
        params(
          operator: Trycourier::ListFilter::Operator::OrSymbol,
          path: Trycourier::ListFilter::Path::OrSymbol,
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
            operator: Trycourier::ListFilter::Operator::OrSymbol,
            path: Trycourier::ListFilter::Path::OrSymbol,
            value: String
          }
        )
      end
      def to_hash
      end

      # Send to users only if they are member of the account
      module Operator
        extend Trycourier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Trycourier::ListFilter::Operator) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        MEMBER_OF =
          T.let(:MEMBER_OF, Trycourier::ListFilter::Operator::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Trycourier::ListFilter::Operator::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      module Path
        extend Trycourier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Trycourier::ListFilter::Path) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ACCOUNT_ID =
          T.let(:account_id, Trycourier::ListFilter::Path::TaggedSymbol)

        sig do
          override.returns(T::Array[Trycourier::ListFilter::Path::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
