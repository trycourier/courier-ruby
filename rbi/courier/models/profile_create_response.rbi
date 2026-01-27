# typed: strong

module Courier
  module Models
    class ProfileCreateResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::Models::ProfileCreateResponse,
            Courier::Internal::AnyHash
          )
        end

      sig do
        returns(Courier::Models::ProfileCreateResponse::Status::TaggedSymbol)
      end
      attr_accessor :status

      sig do
        params(
          status: Courier::Models::ProfileCreateResponse::Status::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(status:)
      end

      sig do
        override.returns(
          {
            status: Courier::Models::ProfileCreateResponse::Status::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      module Status
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Courier::Models::ProfileCreateResponse::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        SUCCESS =
          T.let(
            :SUCCESS,
            Courier::Models::ProfileCreateResponse::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Courier::Models::ProfileCreateResponse::Status::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
