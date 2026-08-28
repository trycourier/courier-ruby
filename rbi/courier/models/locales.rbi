# typed: strong

module Courier
  module Models
    class LocaleItem < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Courier::LocaleItem, Courier::Internal::AnyHash) }

      sig { returns(String) }
      attr_accessor :content

      sig { params(content: String).returns(T.attached_class) }
      def self.new(content:)
      end

      sig { override.returns({ content: String }) }
      def to_hash
      end
    end

    Locales =
      T.let(
        Courier::Internal::Type::HashOf[Courier::LocaleItem],
        Courier::Internal::Type::Converter
      )
  end
end
