# typed: strong

module Courier
  module Models
    class MessageRetrieveResponse < Courier::Models::MessageDetails
      OrHash =
        T.type_alias do
          T.any(
            Courier::Models::MessageRetrieveResponse,
            Courier::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(T::Array[T::Hash[Symbol, T.anything]])) }
      attr_accessor :providers

      sig do
        params(
          providers: T.nilable(T::Array[T::Hash[Symbol, T.anything]])
        ).returns(T.attached_class)
      end
      def self.new(providers: nil)
      end

      sig do
        override.returns(
          { providers: T.nilable(T::Array[T::Hash[Symbol, T.anything]]) }
        )
      end
      def to_hash
      end
    end
  end
end
