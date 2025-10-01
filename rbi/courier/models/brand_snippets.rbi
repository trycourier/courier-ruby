# typed: strong

module Courier
  module Models
    class BrandSnippets < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::BrandSnippets, Courier::Internal::AnyHash)
        end

      sig { returns(T::Array[Courier::BrandSnippets::Item]) }
      attr_accessor :items

      sig do
        params(items: T::Array[Courier::BrandSnippets::Item::OrHash]).returns(
          T.attached_class
        )
      end
      def self.new(items:)
      end

      sig do
        override.returns({ items: T::Array[Courier::BrandSnippets::Item] })
      end
      def to_hash
      end

      class Item < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Courier::BrandSnippets::Item, Courier::Internal::AnyHash)
          end

        sig { returns(Courier::BrandSnippets::Item::Format::OrSymbol) }
        attr_accessor :format_

        sig { returns(String) }
        attr_accessor :name

        sig { returns(String) }
        attr_accessor :value

        sig do
          params(
            format_: Courier::BrandSnippets::Item::Format::OrSymbol,
            name: String,
            value: String
          ).returns(T.attached_class)
        end
        def self.new(format_:, name:, value:)
        end

        sig do
          override.returns(
            {
              format_: Courier::BrandSnippets::Item::Format::OrSymbol,
              name: String,
              value: String
            }
          )
        end
        def to_hash
        end

        module Format
          extend Courier::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Courier::BrandSnippets::Item::Format) }
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          HANDLEBARS =
            T.let(
              :handlebars,
              Courier::BrandSnippets::Item::Format::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Courier::BrandSnippets::Item::Format::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
