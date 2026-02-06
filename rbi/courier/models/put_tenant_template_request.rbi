# typed: strong

module Courier
  module Models
    class PutTenantTemplateRequest < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::PutTenantTemplateRequest, Courier::Internal::AnyHash)
        end

      # Template configuration for creating or updating a tenant notification template
      sig { returns(Courier::TenantTemplateInput) }
      attr_reader :template

      sig { params(template: Courier::TenantTemplateInput::OrHash).void }
      attr_writer :template

      # Whether to publish the template immediately after saving. When true, the
      # template becomes the active/published version. When false (default), the
      # template is saved as a draft.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :published

      sig { params(published: T::Boolean).void }
      attr_writer :published

      # Request body for creating or updating a tenant notification template
      sig do
        params(
          template: Courier::TenantTemplateInput::OrHash,
          published: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # Template configuration for creating or updating a tenant notification template
        template:,
        # Whether to publish the template immediately after saving. When true, the
        # template becomes the active/published version. When false (default), the
        # template is saved as a draft.
        published: nil
      )
      end

      sig do
        override.returns(
          { template: Courier::TenantTemplateInput, published: T::Boolean }
        )
      end
      def to_hash
      end
    end
  end
end
