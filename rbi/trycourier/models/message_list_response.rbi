# typed: strong

module Trycourier
  module Models
    class MessageListResponse < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Trycourier::Models::MessageListResponse,
            Trycourier::Internal::AnyHash
          )
        end

      # Paging information for the result set.
      sig { returns(Trycourier::Paging) }
      attr_reader :paging

      sig { params(paging: Trycourier::Paging::OrHash).void }
      attr_writer :paging

      # An array of messages with their details.
      sig { returns(T::Array[Trycourier::MessageDetails]) }
      attr_accessor :results

      sig do
        params(
          paging: Trycourier::Paging::OrHash,
          results: T::Array[Trycourier::MessageDetails::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # Paging information for the result set.
        paging:,
        # An array of messages with their details.
        results:
      )
      end

      sig do
        override.returns(
          {
            paging: Trycourier::Paging,
            results: T::Array[Trycourier::MessageDetails]
          }
        )
      end
      def to_hash
      end
    end
  end
end
