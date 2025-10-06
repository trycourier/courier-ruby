# typed: strong

module Courier
  module Models
    class EmailFooter < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Courier::EmailFooter, Courier::Internal::AnyHash) }

      sig { returns(T.nilable(T.anything)) }
      attr_reader :content

      sig { params(content: T.anything).void }
      attr_writer :content

      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :inherit_default

      sig do
        params(
          content: T.anything,
          inherit_default: T.nilable(T::Boolean)
        ).returns(T.attached_class)
      end
      def self.new(content: nil, inherit_default: nil)
      end

      sig do
        override.returns(
          { content: T.anything, inherit_default: T.nilable(T::Boolean) }
        )
      end
      def to_hash
      end
    end
  end
end
