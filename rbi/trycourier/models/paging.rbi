# typed: strong

module Trycourier
  module Models
    class Paging < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::Paging, Trycourier::Internal::AnyHash)
        end

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
