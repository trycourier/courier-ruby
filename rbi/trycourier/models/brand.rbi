# typed: strong

module Trycourier
  module Models
    class Brand < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Trycourier::Brand, Trycourier::Internal::AnyHash) }

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

      sig { returns(T.nilable(String)) }
      attr_accessor :version

      sig do
        params(
          id: String,
          created: Integer,
          name: String,
          updated: Integer,
          published: T.nilable(Integer),
          settings: T.nilable(Trycourier::BrandSettings::OrHash),
          snippets: T.nilable(Trycourier::BrandSnippets::OrHash),
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
            settings: T.nilable(Trycourier::BrandSettings),
            snippets: T.nilable(Trycourier::BrandSnippets),
            version: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
