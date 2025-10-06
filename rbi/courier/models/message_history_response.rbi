# typed: strong

module Courier
  module Models
    class MessageHistoryResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::Models::MessageHistoryResponse,
            Courier::Internal::AnyHash
          )
        end

      sig { returns(T::Array[T::Hash[Symbol, T.anything]]) }
      attr_accessor :results

      sig do
        params(results: T::Array[T::Hash[Symbol, T.anything]]).returns(
          T.attached_class
        )
      end
      def self.new(results:)
      end

      sig do
        override.returns({ results: T::Array[T::Hash[Symbol, T.anything]] })
      end
      def to_hash
      end
    end
  end
end
