# typed: strong

module Trycourier
  module Models
    class ProfileCreateResponse < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Trycourier::Models::ProfileCreateResponse,
            Trycourier::Internal::AnyHash
          )
        end

      sig do
        returns(Trycourier::Models::ProfileCreateResponse::Status::TaggedSymbol)
      end
      attr_accessor :status

      sig do
        params(
          status: Trycourier::Models::ProfileCreateResponse::Status::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(status:)
      end

      sig do
        override.returns(
          {
            status:
              Trycourier::Models::ProfileCreateResponse::Status::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      module Status
        extend Trycourier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Trycourier::Models::ProfileCreateResponse::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        SUCCESS =
          T.let(
            :SUCCESS,
            Trycourier::Models::ProfileCreateResponse::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Trycourier::Models::ProfileCreateResponse::Status::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
