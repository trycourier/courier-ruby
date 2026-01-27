# typed: strong

module Courier
  module Models
    class MessageListResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::Models::MessageListResponse,
            Courier::Internal::AnyHash
          )
        end

      # Paging information for the result set.
      sig { returns(Courier::Paging) }
      attr_reader :paging

      sig { params(paging: Courier::Paging::OrHash).void }
      attr_writer :paging

      # An array of messages with their details.
      sig { returns(T::Array[Courier::MessageDetails]) }
      attr_accessor :results

      sig do
        params(
          paging: Courier::Paging::OrHash,
          results: T::Array[Courier::MessageDetails::OrHash]
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
            paging: Courier::Paging,
            results: T::Array[Courier::MessageDetails]
          }
        )
      end
      def to_hash
      end
    end
  end
end
