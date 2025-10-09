# typed: strong

module Trycourier
  module Models
    class BaseCheck < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::BaseCheck, Trycourier::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(Trycourier::BaseCheck::Status::OrSymbol) }
      attr_accessor :status

      sig { returns(Trycourier::BaseCheck::Type::OrSymbol) }
      attr_accessor :type

      sig do
        params(
          id: String,
          status: Trycourier::BaseCheck::Status::OrSymbol,
          type: Trycourier::BaseCheck::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(id:, status:, type:)
      end

      sig do
        override.returns(
          {
            id: String,
            status: Trycourier::BaseCheck::Status::OrSymbol,
            type: Trycourier::BaseCheck::Type::OrSymbol
          }
        )
      end
      def to_hash
      end

      module Status
        extend Trycourier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Trycourier::BaseCheck::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        RESOLVED = T.let(:RESOLVED, Trycourier::BaseCheck::Status::TaggedSymbol)
        FAILED = T.let(:FAILED, Trycourier::BaseCheck::Status::TaggedSymbol)
        PENDING = T.let(:PENDING, Trycourier::BaseCheck::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Trycourier::BaseCheck::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      module Type
        extend Trycourier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Trycourier::BaseCheck::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CUSTOM = T.let(:custom, Trycourier::BaseCheck::Type::TaggedSymbol)

        sig do
          override.returns(T::Array[Trycourier::BaseCheck::Type::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
