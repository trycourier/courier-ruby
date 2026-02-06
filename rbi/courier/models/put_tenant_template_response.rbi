# typed: strong

module Courier
  module Models
    class PutTenantTemplateResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::PutTenantTemplateResponse, Courier::Internal::AnyHash)
        end

      # The template ID
      sig { returns(String) }
      attr_accessor :id

      # The version of the saved template
      sig { returns(String) }
      attr_accessor :version

      # The timestamp when the template was published. Only present if the template was
      # published as part of this request.
      sig { returns(T.nilable(String)) }
      attr_accessor :published_at

      # Response from creating or updating a tenant notification template
      sig do
        params(
          id: String,
          version: String,
          published_at: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # The template ID
        id:,
        # The version of the saved template
        version:,
        # The timestamp when the template was published. Only present if the template was
        # published as part of this request.
        published_at: nil
      )
      end

      sig do
        override.returns(
          { id: String, version: String, published_at: T.nilable(String) }
        )
      end
      def to_hash
      end
    end
  end
end
