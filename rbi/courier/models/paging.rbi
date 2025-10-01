# typed: strong

module Courier
  module Models
    class Paging < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Courier::Paging, Courier::Internal::AnyHash) }

      sig { returns(T::Boolean) }
      attr_accessor :more

      sig { returns(T.nilable(String)) }
      attr_accessor :cursor

      sig do
        params(more: T::Boolean, cursor: T.nilable(String)).returns(
          T.attached_class
        )
      end
      def self.new(more:, cursor: nil)
      end

      sig { override.returns({ more: T::Boolean, cursor: T.nilable(String) }) }
      def to_hash
      end
    end
  end
end
