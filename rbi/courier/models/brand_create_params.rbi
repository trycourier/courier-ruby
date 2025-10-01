# typed: strong

module Courier
  module Models
    class BrandCreateParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Courier::BrandCreateParams, Courier::Internal::AnyHash)
        end

      # The name of the brand.
      sig { returns(String) }
      attr_accessor :name

      sig { returns(Courier::BrandSettings) }
      attr_reader :settings

      sig { params(settings: Courier::BrandSettings::OrHash).void }
      attr_writer :settings

      sig { returns(T.nilable(String)) }
      attr_accessor :id

      sig { returns(T.nilable(Courier::BrandSnippets)) }
      attr_reader :snippets

      sig { params(snippets: T.nilable(Courier::BrandSnippets::OrHash)).void }
      attr_writer :snippets

      sig do
        params(
          name: String,
          settings: Courier::BrandSettings::OrHash,
          id: T.nilable(String),
          snippets: T.nilable(Courier::BrandSnippets::OrHash),
          request_options: Courier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The name of the brand.
        name:,
        settings:,
        id: nil,
        snippets: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            name: String,
            settings: Courier::BrandSettings,
            id: T.nilable(String),
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
