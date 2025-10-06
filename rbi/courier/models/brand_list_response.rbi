# typed: strong

module Courier
  module Models
    class BrandListResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::Models::BrandListResponse, Courier::Internal::AnyHash)
        end

      sig { returns(Courier::Paging) }
      attr_reader :paging

      sig { params(paging: Courier::Paging::OrHash).void }
      attr_writer :paging

      sig { returns(T::Array[Courier::Brand]) }
      attr_accessor :results

      sig do
        params(
          paging: Courier::Paging::OrHash,
          results: T::Array[Courier::Brand::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(paging:, results:)
      end

      sig do
        override.returns(
          { paging: Courier::Paging, results: T::Array[Courier::Brand] }
        )
      end
      def to_hash
      end
    end
  end
end
