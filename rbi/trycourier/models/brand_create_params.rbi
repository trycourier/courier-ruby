# typed: strong

module Trycourier
  module Models
    class BrandCreateParams < Trycourier::Internal::Type::BaseModel
      extend Trycourier::Internal::Type::RequestParameters::Converter
      include Trycourier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Trycourier::BrandCreateParams, Trycourier::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :name

      sig { returns(T.nilable(String)) }
      attr_accessor :id

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
          id: T.nilable(String),
          settings: T.nilable(Trycourier::BrandSettings::OrHash),
          snippets: T.nilable(Trycourier::BrandSnippets::OrHash),
          request_options: Trycourier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        name:,
        id: nil,
        settings: nil,
        snippets: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            name: String,
            id: T.nilable(String),
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
