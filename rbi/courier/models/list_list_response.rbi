# typed: strong

module Courier
  module Models
    class ListListResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::Models::ListListResponse, Courier::Internal::AnyHash)
        end

      sig { returns(T::Array[Courier::List]) }
      attr_accessor :items

      sig { returns(Courier::Paging) }
      attr_reader :paging

      sig { params(paging: Courier::Paging::OrHash).void }
      attr_writer :paging

      sig do
        params(
          items: T::Array[Courier::List::OrHash],
          paging: Courier::Paging::OrHash
        ).returns(T.attached_class)
      end
      def self.new(items:, paging:)
      end

      sig do
        override.returns(
          { items: T::Array[Courier::List], paging: Courier::Paging }
        )
      end
      def to_hash
      end
    end
  end
end
