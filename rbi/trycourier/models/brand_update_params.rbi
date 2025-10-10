# typed: strong

module Trycourier
  module Models
    class BrandUpdateParams < Trycourier::Internal::Type::BaseModel
      extend Trycourier::Internal::Type::RequestParameters::Converter
      include Trycourier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Trycourier::BrandUpdateParams, Trycourier::Internal::AnyHash)
        end

      # The name of the brand.
      sig { returns(String) }
      attr_accessor :name

      sig { returns(T.nilable(Trycourier::BrandSettings)) }
      attr_reader :settings

      sig do
        params(settings: T.nilable(Trycourier::BrandSettings::OrHash)).void
      end
      attr_writer :settings

      sig { returns(T.nilable(Trycourier::BrandSnippets)) }
      attr_reader :snippets

      sig do
        params(snippets: T.nilable(Trycourier::BrandSnippets::OrHash)).void
      end
      attr_writer :snippets

      sig do
        params(
          name: String,
          settings: T.nilable(Trycourier::BrandSettings::OrHash),
          snippets: T.nilable(Trycourier::BrandSnippets::OrHash),
          request_options: Trycourier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The name of the brand.
        name:,
        settings: nil,
        snippets: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            name: String,
            settings: T.nilable(Trycourier::BrandSettings),
            snippets: T.nilable(Trycourier::BrandSnippets),
            request_options: Trycourier::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
