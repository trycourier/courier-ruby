# typed: strong

module Courier
  module Models
    class EmailHead < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Courier::EmailHead, Courier::Internal::AnyHash) }

      sig { returns(T::Boolean) }
      attr_accessor :inherit_default

      sig { returns(T.nilable(String)) }
      attr_accessor :content

      sig do
        params(inherit_default: T::Boolean, content: T.nilable(String)).returns(
          T.attached_class
        )
      end
      def self.new(inherit_default:, content: nil)
      end

      sig do
        override.returns(
          { inherit_default: T::Boolean, content: T.nilable(String) }
        )
      end
      def to_hash
      end
    end
  end
end
