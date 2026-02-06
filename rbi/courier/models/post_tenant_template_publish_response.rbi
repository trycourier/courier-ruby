# typed: strong

module Courier
  module Models
    class PostTenantTemplatePublishResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::PostTenantTemplatePublishResponse,
            Courier::Internal::AnyHash
          )
        end

      # The template ID
      sig { returns(String) }
      attr_accessor :id

      # The timestamp when the template was published
      sig { returns(String) }
      attr_accessor :published_at

      # The published version of the template
      sig { returns(String) }
      attr_accessor :version

      # Response from publishing a tenant template
      sig do
        params(id: String, published_at: String, version: String).returns(
          T.attached_class
        )
      end
      def self.new(
        # The template ID
        id:,
        # The timestamp when the template was published
        published_at:,
        # The published version of the template
        version:
      )
      end

      sig do
        override.returns({ id: String, published_at: String, version: String })
      end
      def to_hash
      end
    end
  end
end
