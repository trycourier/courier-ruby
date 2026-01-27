# typed: strong

module Courier
  module Models
    class AudienceFilter < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::AudienceFilter, Courier::Internal::AnyHash)
        end

      # Send to users only if they are member of the account
      sig { returns(Courier::AudienceFilter::Operator::OrSymbol) }
      attr_accessor :operator

      sig { returns(Courier::AudienceFilter::Path::OrSymbol) }
      attr_accessor :path

      sig { returns(String) }
      attr_accessor :value

      sig do
        params(
          operator: Courier::AudienceFilter::Operator::OrSymbol,
          path: Courier::AudienceFilter::Path::OrSymbol,
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
            operator: Courier::AudienceFilter::Operator::OrSymbol,
            path: Courier::AudienceFilter::Path::OrSymbol,
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
          T.type_alias { T.all(Symbol, Courier::AudienceFilter::Operator) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        MEMBER_OF =
          T.let(:MEMBER_OF, Courier::AudienceFilter::Operator::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Courier::AudienceFilter::Operator::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      module Path
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Courier::AudienceFilter::Path) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ACCOUNT_ID =
          T.let(:account_id, Courier::AudienceFilter::Path::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Courier::AudienceFilter::Path::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
