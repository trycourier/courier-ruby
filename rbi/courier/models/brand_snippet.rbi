# typed: strong

module Courier
  module Models
    class BrandSnippet < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::BrandSnippet, Courier::Internal::AnyHash)
        end

      sig { returns(Courier::BrandSnippet::Format::OrSymbol) }
      attr_accessor :format_

      sig { returns(String) }
      attr_accessor :name

      sig { returns(String) }
      attr_accessor :value

      sig do
        params(
          format_: Courier::BrandSnippet::Format::OrSymbol,
          name: String,
          value: String
        ).returns(T.attached_class)
      end
      def self.new(format_:, name:, value:)
      end

      sig do
        override.returns(
          {
            format_: Courier::BrandSnippet::Format::OrSymbol,
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
          T.type_alias { T.all(Symbol, Courier::BrandSnippet::Format) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        HANDLEBARS =
          T.let(:handlebars, Courier::BrandSnippet::Format::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Courier::BrandSnippet::Format::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
