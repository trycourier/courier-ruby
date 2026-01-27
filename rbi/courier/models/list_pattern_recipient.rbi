# typed: strong

module Courier
  module Models
    class ListPatternRecipient < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::ListPatternRecipient, Courier::Internal::AnyHash)
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
