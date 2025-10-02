# typed: strong

module Courier
  module Models
    class BrandSnippets < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::BrandSnippets, Courier::Internal::AnyHash)
        end

      sig { returns(T::Array[Courier::BrandSnippet]) }
      attr_accessor :items

      sig do
        params(items: T::Array[Courier::BrandSnippet::OrHash]).returns(
          T.attached_class
        )
      end
      def self.new(items:)
      end

      sig { override.returns({ items: T::Array[Courier::BrandSnippet] }) }
      def to_hash
      end
    end
  end
end
