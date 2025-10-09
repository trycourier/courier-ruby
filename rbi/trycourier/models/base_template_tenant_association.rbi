# typed: strong

module Trycourier
  module Models
    class BaseTemplateTenantAssociation < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Trycourier::BaseTemplateTenantAssociation,
            Trycourier::Internal::AnyHash
          )
        end

      # The template's id
      sig { returns(String) }
      attr_accessor :id

      # The timestamp at which the template was created
      sig { returns(String) }
      attr_accessor :created_at

      # The timestamp at which the template was published
      sig { returns(String) }
      attr_accessor :published_at

      # The timestamp at which the template was last updated
      sig { returns(String) }
      attr_accessor :updated_at

      # The version of the template
      sig { returns(String) }
      attr_accessor :version

      sig do
        params(
          id: String,
          created_at: String,
          published_at: String,
          updated_at: String,
          version: String
        ).returns(T.attached_class)
      end
      def self.new(
        # The template's id
        id:,
        # The timestamp at which the template was created
        created_at:,
        # The timestamp at which the template was published
        published_at:,
        # The timestamp at which the template was last updated
        updated_at:,
        # The version of the template
        version:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            created_at: String,
            published_at: String,
            updated_at: String,
            version: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
