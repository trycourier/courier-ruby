# typed: strong

module Courier
  module Models
    class Brand < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Courier::Brand, Courier::Internal::AnyHash) }

      # The date/time of when the brand was created. Represented in milliseconds since
      # Unix epoch.
      sig { returns(Integer) }
      attr_accessor :created

      # Brand name
      sig { returns(String) }
      attr_accessor :name

      # The date/time of when the brand was published. Represented in milliseconds since
      # Unix epoch.
      sig { returns(Integer) }
      attr_accessor :published

      sig { returns(Courier::BrandSettings) }
      attr_reader :settings

      sig { params(settings: Courier::BrandSettings::OrHash).void }
      attr_writer :settings

      # The date/time of when the brand was updated. Represented in milliseconds since
      # Unix epoch.
      sig { returns(Integer) }
      attr_accessor :updated

      # The version identifier for the brand
      sig { returns(String) }
      attr_accessor :version

      # Brand Identifier
      sig { returns(T.nilable(String)) }
      attr_accessor :id

      sig { returns(T.nilable(Courier::BrandSnippets)) }
      attr_reader :snippets

      sig { params(snippets: T.nilable(Courier::BrandSnippets::OrHash)).void }
      attr_writer :snippets

      sig do
        params(
          created: Integer,
          name: String,
          published: Integer,
          settings: Courier::BrandSettings::OrHash,
          updated: Integer,
          version: String,
          id: T.nilable(String),
          snippets: T.nilable(Courier::BrandSnippets::OrHash)
        ).returns(T.attached_class)
      end
      def self.new(
        # The date/time of when the brand was created. Represented in milliseconds since
        # Unix epoch.
        created:,
        # Brand name
        name:,
        # The date/time of when the brand was published. Represented in milliseconds since
        # Unix epoch.
        published:,
        settings:,
        # The date/time of when the brand was updated. Represented in milliseconds since
        # Unix epoch.
        updated:,
        # The version identifier for the brand
        version:,
        # Brand Identifier
        id: nil,
        snippets: nil
      )
      end

      sig do
        override.returns(
          {
            created: Integer,
            name: String,
            published: Integer,
            settings: Courier::BrandSettings,
            updated: Integer,
            version: String,
            id: T.nilable(String),
            snippets: T.nilable(Courier::BrandSnippets)
          }
        )
      end
      def to_hash
      end
    end
  end
end
