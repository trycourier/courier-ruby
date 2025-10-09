# typed: strong

module Trycourier
  module Models
    class BrandSnippets < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::BrandSnippets, Trycourier::Internal::AnyHash)
        end

      sig { returns(T.nilable(T::Array[Trycourier::BrandSnippet])) }
      attr_accessor :items

      sig do
        params(
          items: T.nilable(T::Array[Trycourier::BrandSnippet::OrHash])
        ).returns(T.attached_class)
      end
      def self.new(items: nil)
      end

      sig do
        override.returns(
          { items: T.nilable(T::Array[Trycourier::BrandSnippet]) }
        )
      end
      def to_hash
      end
    end
  end
end
