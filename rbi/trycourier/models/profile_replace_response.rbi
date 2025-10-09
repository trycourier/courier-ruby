# typed: strong

module Trycourier
  module Models
    class ProfileReplaceResponse < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Trycourier::Models::ProfileReplaceResponse,
            Trycourier::Internal::AnyHash
          )
        end

      sig do
        returns(
          Trycourier::Models::ProfileReplaceResponse::Status::TaggedSymbol
        )
      end
      attr_accessor :status

      sig do
        params(
          status: Trycourier::Models::ProfileReplaceResponse::Status::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(status:)
      end

      sig do
        override.returns(
          {
            status:
              Trycourier::Models::ProfileReplaceResponse::Status::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      module Status
        extend Trycourier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Trycourier::Models::ProfileReplaceResponse::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        SUCCESS =
          T.let(
            :SUCCESS,
            Trycourier::Models::ProfileReplaceResponse::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Trycourier::Models::ProfileReplaceResponse::Status::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
