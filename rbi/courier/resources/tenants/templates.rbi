# typed: strong

module Courier
  module Resources
    class Tenants
      class Templates
        sig { returns(Courier::Resources::Tenants::Templates::Versions) }
        attr_reader :versions

        # Get a Template in Tenant
        sig do
          params(
            template_id: String,
            tenant_id: String,
            request_options: Courier::RequestOptions::OrHash
          ).returns(Courier::BaseTemplateTenantAssociation)
        end
        def retrieve(
          # Id of the template to be retrieved.
          template_id,
          # Id of the tenant for which to retrieve the template.
          tenant_id:,
          request_options: {}
        )
        end

        # List Templates in Tenant
        sig do
          params(
            tenant_id: String,
            cursor: T.nilable(String),
            limit: T.nilable(Integer),
            request_options: Courier::RequestOptions::OrHash
          ).returns(Courier::Models::Tenants::TemplateListResponse)
        end
        def list(
          # Id of the tenant for which to retrieve the templates.
          tenant_id,
          # Continue the pagination with the next cursor
          cursor: nil,
          # The number of templates to return (defaults to 20, maximum value of 100)
          limit: nil,
          request_options: {}
        )
        end

        # Publishes a specific version of a notification template for a tenant.
        #
        # The template must already exist in the tenant's notification map. If no version
        # is specified, defaults to publishing the "latest" version.
        sig do
          params(
            template_id: String,
            tenant_id: String,
            version: String,
            request_options: Courier::RequestOptions::OrHash
          ).returns(Courier::PostTenantTemplatePublishResponse)
        end
        def publish(
          # Path param: Id of the template to be published.
          template_id,
          # Path param: Id of the tenant that owns the template.
          tenant_id:,
          # Body param: The version of the template to publish (e.g., "v1", "v2", "latest").
          # If not provided, defaults to "latest".
          version: nil,
          request_options: {}
        )
        end

        # Creates or updates a notification template for a tenant.
        #
        # If the template already exists for the tenant, it will be updated (200).
        # Otherwise, a new template is created (201).
        #
        # Optionally publishes the template immediately if the `published` flag is set to
        # true.
        sig do
          params(
            template_id: String,
            tenant_id: String,
            template: Courier::TenantTemplateInput::OrHash,
            published: T::Boolean,
            request_options: Courier::RequestOptions::OrHash
          ).returns(Courier::PutTenantTemplateResponse)
        end
        def replace(
          # Path param: Id of the template to be created or updated.
          template_id,
          # Path param: Id of the tenant for which to create or update the template.
          tenant_id:,
          # Body param: Template configuration for creating or updating a tenant
          # notification template
          template:,
          # Body param: Whether to publish the template immediately after saving. When true,
          # the template becomes the active/published version. When false (default), the
          # template is saved as a draft.
          published: nil,
          request_options: {}
        )
        end

        # @api private
        sig { params(client: Courier::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
