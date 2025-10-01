# typed: strong

module Courier
  module Models
    class BrandUpdateParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Courier::BrandUpdateParams, Courier::Internal::AnyHash)
        end

      # The name of the brand.
      sig { returns(String) }
      attr_accessor :name

      sig { returns(T.nilable(Courier::BrandSettings)) }
      attr_reader :settings

      sig { params(settings: T.nilable(Courier::BrandSettings::OrHash)).void }
      attr_writer :settings

      sig { returns(T.nilable(Courier::BrandSnippets)) }
      attr_reader :snippets

      sig { params(snippets: T.nilable(Courier::BrandSnippets::OrHash)).void }
      attr_writer :snippets

      sig do
        params(
          name: String,
          settings: T.nilable(Courier::BrandSettings::OrHash),
          snippets: T.nilable(Courier::BrandSnippets::OrHash),
          request_options: Courier::RequestOptions::OrHash
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
            settings: T.nilable(Courier::BrandSettings),
            snippets: T.nilable(Courier::BrandSnippets),
            request_options: Courier::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
