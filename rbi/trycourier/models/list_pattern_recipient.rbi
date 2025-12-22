# typed: strong

module Trycourier
  module Models
    class ListPatternRecipient < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::ListPatternRecipient, Trycourier::Internal::AnyHash)
        end

      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_accessor :data

      sig { returns(T.nilable(String)) }
      attr_accessor :list_pattern

      # Send to users in lists matching a pattern
      sig do
        params(
          data: T.nilable(T::Hash[Symbol, T.anything]),
          list_pattern: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(data: nil, list_pattern: nil)
      end

      sig do
        override.returns(
          {
            data: T.nilable(T::Hash[Symbol, T.anything]),
            list_pattern: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
