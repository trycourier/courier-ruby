# typed: strong

module Courier
  module Models
    class BrandSnippets < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::BrandSnippets, Courier::Internal::AnyHash)
        end

      sig { returns(T.nilable(T::Array[Courier::BrandSnippets::Item])) }
      attr_accessor :items

      sig do
        params(
          items: T.nilable(T::Array[Courier::BrandSnippets::Item::OrHash])
        ).returns(T.attached_class)
      end
      def self.new(items: nil)
      end

      sig do
        override.returns(
          { items: T.nilable(T::Array[Courier::BrandSnippets::Item]) }
        )
      end
      def to_hash
      end

      class Item < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Courier::BrandSnippets::Item, Courier::Internal::AnyHash)
          end

        sig { returns(String) }
        attr_accessor :name

        sig { returns(String) }
        attr_accessor :value

        sig { params(name: String, value: String).returns(T.attached_class) }
        def self.new(name:, value:)
        end

        sig { override.returns({ name: String, value: String }) }
        def to_hash
        end
      end
    end
  end
end
