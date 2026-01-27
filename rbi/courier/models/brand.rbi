# typed: strong

module Courier
  module Models
    class Brand < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Courier::Brand, Courier::Internal::AnyHash) }

      sig { returns(String) }
      attr_accessor :id

      sig { returns(Integer) }
      attr_accessor :created

      sig { returns(String) }
      attr_accessor :name

      sig { returns(Integer) }
      attr_accessor :updated

      sig { returns(T.nilable(Integer)) }
      attr_accessor :published

      sig { returns(T.nilable(Courier::BrandSettings)) }
      attr_reader :settings

      sig { params(settings: T.nilable(Courier::BrandSettings::OrHash)).void }
      attr_writer :settings

      sig { returns(T.nilable(Courier::BrandSnippets)) }
      attr_reader :snippets

      sig { params(snippets: T.nilable(Courier::BrandSnippets::OrHash)).void }
      attr_writer :snippets

      sig { returns(T.nilable(String)) }
      attr_accessor :version

      sig do
        params(
          id: String,
          created: Integer,
          name: String,
          updated: Integer,
          published: T.nilable(Integer),
          settings: T.nilable(Courier::BrandSettings::OrHash),
          snippets: T.nilable(Courier::BrandSnippets::OrHash),
          version: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        created:,
        name:,
        updated:,
        published: nil,
        settings: nil,
        snippets: nil,
        version: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            created: Integer,
            name: String,
            updated: Integer,
            published: T.nilable(Integer),
            settings: T.nilable(Courier::BrandSettings),
            snippets: T.nilable(Courier::BrandSnippets),
            version: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
