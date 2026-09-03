# typed: strong

module Courier
  module Resources
    class Tenants
      # Manage the templates and template versions scoped to a single tenant, including
      # the ones authored in the embedded designer.
      class Templates
        # Manage the templates and template versions scoped to a single tenant, including
        # the ones authored in the embedded designer.
        sig { returns(Courier::Resources::Tenants::Templates::Versions) }
        attr_reader :versions

        # Returns a tenant's notification template with its content, version, and created,
        # updated, and published timestamps.
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

        # Lists a tenant's notification templates, each carrying its version and published
        # timestamp. Paged.
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

        # Deletes a tenant's notification template by id. Sends for that tenant then use
        # the workspace template registered under the same id.
        sig do
          params(
            template_id: String,
            tenant_id: String,
            request_options: Courier::RequestOptions::OrHash
          ).void
        end
        def delete(
          # Id of the template to remove from the tenant.
          template_id,
          # Id of the tenant that owns the template.
          tenant_id:,
          request_options: {}
        )
        end

        # Publishes a version of a tenant's notification template, making it the content
        # that tenant's sends render from until you publish another.
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

        # Creates or updates a notification template scoped to one tenant, letting a
        # tenant override the content the workspace template would send.
        #
        # This is an upsert: it creates when the tenant has no template under
        # `template_id`, and updates when it does. On the create half, content must place
        # its elements inside a channel block —
        # `{ "type": "channel", "channel": "email", "elements": [...] }` — or the request
        # returns `400`. The template designer renders only the channel block matching the
        # tab it draws, so content stored without one cannot be opened. An empty
        # `elements` array is accepted, as is the `{ title, body }` shorthand, which has
        # no elements to wrap. Updates are not checked, so tenant templates already stored
        # without a wrapper stay editable.
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
