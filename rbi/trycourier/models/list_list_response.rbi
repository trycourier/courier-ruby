# typed: strong

module Trycourier
  module Models
    class ListListResponse < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Trycourier::Models::ListListResponse,
            Trycourier::Internal::AnyHash
          )
        end

      sig { returns(T::Array[Trycourier::SubscriptionList]) }
      attr_accessor :items

      sig { returns(Trycourier::Paging) }
      attr_reader :paging

      sig { params(paging: Trycourier::Paging::OrHash).void }
      attr_writer :paging

      sig do
        params(
          items: T::Array[Trycourier::SubscriptionList::OrHash],
          paging: Trycourier::Paging::OrHash
        ).returns(T.attached_class)
      end
      def self.new(items:, paging:)
      end

      sig do
        override.returns(
          {
            items: T::Array[Trycourier::SubscriptionList],
            paging: Trycourier::Paging
          }
        )
      end
      def to_hash
      end
    end
  end
end
