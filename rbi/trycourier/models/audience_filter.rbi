# typed: strong

module Trycourier
  module Models
    class AudienceFilter < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::AudienceFilter, Trycourier::Internal::AnyHash)
        end

      # Send to users only if they are member of the account
      sig { returns(Trycourier::AudienceFilter::Operator::OrSymbol) }
      attr_accessor :operator

      sig { returns(Trycourier::AudienceFilter::Path::OrSymbol) }
      attr_accessor :path

      sig { returns(String) }
      attr_accessor :value

      sig do
        params(
          operator: Trycourier::AudienceFilter::Operator::OrSymbol,
          path: Trycourier::AudienceFilter::Path::OrSymbol,
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
            operator: Trycourier::AudienceFilter::Operator::OrSymbol,
            path: Trycourier::AudienceFilter::Path::OrSymbol,
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
          T.type_alias { T.all(Symbol, Trycourier::AudienceFilter::Operator) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        MEMBER_OF =
          T.let(:MEMBER_OF, Trycourier::AudienceFilter::Operator::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Trycourier::AudienceFilter::Operator::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      module Path
        extend Trycourier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Trycourier::AudienceFilter::Path) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ACCOUNT_ID =
          T.let(:account_id, Trycourier::AudienceFilter::Path::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Trycourier::AudienceFilter::Path::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
