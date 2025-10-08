# typed: strong

module Courier
  module Models
    class BaseCheck < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Courier::BaseCheck, Courier::Internal::AnyHash) }

      sig { returns(String) }
      attr_accessor :id

      sig { returns(Courier::BaseCheck::Status::OrSymbol) }
      attr_accessor :status

      sig { returns(Courier::BaseCheck::Type::OrSymbol) }
      attr_accessor :type

      sig do
        params(
          id: String,
          status: Courier::BaseCheck::Status::OrSymbol,
          type: Courier::BaseCheck::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(id:, status:, type:)
      end

      sig do
        override.returns(
          {
            id: String,
            status: Courier::BaseCheck::Status::OrSymbol,
            type: Courier::BaseCheck::Type::OrSymbol
          }
        )
      end
      def to_hash
      end

      module Status
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Courier::BaseCheck::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        RESOLVED = T.let(:RESOLVED, Courier::BaseCheck::Status::TaggedSymbol)
        FAILED = T.let(:FAILED, Courier::BaseCheck::Status::TaggedSymbol)
        PENDING = T.let(:PENDING, Courier::BaseCheck::Status::TaggedSymbol)

        sig do
          override.returns(T::Array[Courier::BaseCheck::Status::TaggedSymbol])
        end
        def self.values
        end
      end

      module Type
        extend Courier::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Courier::BaseCheck::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CUSTOM = T.let(:custom, Courier::BaseCheck::Type::TaggedSymbol)

        sig do
          override.returns(T::Array[Courier::BaseCheck::Type::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
