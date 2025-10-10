# typed: strong

module Trycourier
  module Models
    class MessageRetrieveResponse < Trycourier::Models::MessageDetails
      OrHash =
        T.type_alias do
          T.any(
            Trycourier::Models::MessageRetrieveResponse,
            Trycourier::Internal::AnyHash
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
