# typed: strong

module Courier
  module Models
    module Notifications
      class BaseCheck < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Courier::Notifications::BaseCheck, Courier::Internal::AnyHash)
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(Courier::Notifications::BaseCheck::Status::OrSymbol) }
        attr_accessor :status

        sig { returns(Courier::Notifications::BaseCheck::Type::OrSymbol) }
        attr_accessor :type

        sig do
          params(
            id: String,
            status: Courier::Notifications::BaseCheck::Status::OrSymbol,
            type: Courier::Notifications::BaseCheck::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(id:, status:, type:)
        end

        sig do
          override.returns(
            {
              id: String,
              status: Courier::Notifications::BaseCheck::Status::OrSymbol,
              type: Courier::Notifications::BaseCheck::Type::OrSymbol
            }
          )
        end
        def to_hash
        end

        module Status
          extend Courier::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Courier::Notifications::BaseCheck::Status)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          RESOLVED =
            T.let(
              :RESOLVED,
              Courier::Notifications::BaseCheck::Status::TaggedSymbol
            )
          FAILED =
            T.let(
              :FAILED,
              Courier::Notifications::BaseCheck::Status::TaggedSymbol
            )
          PENDING =
            T.let(
              :PENDING,
              Courier::Notifications::BaseCheck::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Courier::Notifications::BaseCheck::Status::TaggedSymbol]
            )
          end
          def self.values
          end
        end

        module Type
          extend Courier::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Courier::Notifications::BaseCheck::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          CUSTOM =
            T.let(
              :custom,
              Courier::Notifications::BaseCheck::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Courier::Notifications::BaseCheck::Type::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
