# frozen_string_literal: true

module Courier
  module Resources
    class Tenants
      class Templates
        # @return [Courier::Resources::Tenants::Templates::Versions]
        attr_reader :versions

        # Returns a tenant's notification template with its content, version, and created,
        # updated, and published timestamps.
        #
        # @overload retrieve(template_id, tenant_id:, request_options: {})
        #
        # @param template_id [String] Id of the template to be retrieved.
        #
        # @param tenant_id [String] Id of the tenant for which to retrieve the template.
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Courier::Models::BaseTemplateTenantAssociation]
        #
        # @see Courier::Models::Tenants::TemplateRetrieveParams
        def retrieve(template_id, params)
          parsed, options = Courier::Tenants::TemplateRetrieveParams.dump_request(params)
          tenant_id =
            parsed.delete(:tenant_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :get,
            path: ["tenants/%1$s/templates/%2$s", tenant_id, template_id],
            model: Courier::BaseTemplateTenantAssociation,
            options: options
          )
        end

        # Lists a tenant's notification templates, each carrying its version and published
        # timestamp. Paged.
        #
        # @overload list(tenant_id, cursor: nil, limit: nil, request_options: {})
        #
        # @param tenant_id [String] Id of the tenant for which to retrieve the templates.
        #
        # @param cursor [String, nil] Continue the pagination with the next cursor
        #
        # @param limit [Integer, nil] The number of templates to return (defaults to 20, maximum value of 100)
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Courier::Models::Tenants::TemplateListResponse]
        #
        # @see Courier::Models::Tenants::TemplateListParams
        def list(tenant_id, params = {})
          parsed, options = Courier::Tenants::TemplateListParams.dump_request(params)
          query = Courier::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["tenants/%1$s/templates", tenant_id],
            query: query,
            model: Courier::Models::Tenants::TemplateListResponse,
            options: options
          )
        end

        # Deletes a tenant's notification template by id. Sends for that tenant then use
        # the workspace template registered under the same id.
        #
        # @overload delete(template_id, tenant_id:, request_options: {})
        #
        # @param template_id [String] Id of the template to remove from the tenant.
        #
        # @param tenant_id [String] Id of the tenant that owns the template.
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Courier::Models::Tenants::TemplateDeleteParams
        def delete(template_id, params)
          parsed, options = Courier::Tenants::TemplateDeleteParams.dump_request(params)
          tenant_id =
            parsed.delete(:tenant_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :delete,
            path: ["tenants/%1$s/templates/%2$s", tenant_id, template_id],
            model: NilClass,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Courier::Models::Tenants::TemplatePublishParams} for more details.
        #
        # Publishes a version of a tenant's notification template, making it the content
        # that tenant's sends render from until you publish another.
        #
        # @overload publish(template_id, tenant_id:, version: nil, request_options: {})
        #
        # @param template_id [String] Path param: Id of the template to be published.
        #
        # @param tenant_id [String] Path param: Id of the tenant that owns the template.
        #
        # @param version [String] Body param: The version of the template to publish (e.g., "v1", "v2", "latest").
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Courier::Models::PostTenantTemplatePublishResponse]
        #
        # @see Courier::Models::Tenants::TemplatePublishParams
        def publish(template_id, params)
          parsed, options = Courier::Tenants::TemplatePublishParams.dump_request(params)
          tenant_id =
            parsed.delete(:tenant_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :post,
            path: ["tenants/%1$s/templates/%2$s/publish", tenant_id, template_id],
            body: parsed,
            model: Courier::PostTenantTemplatePublishResponse,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Courier::Models::Tenants::TemplateReplaceParams} for more details.
        #
        # Creates or updates a notification template scoped to one tenant, letting a
        # tenant override the content the workspace template would send.
        #
        # @overload replace(template_id, tenant_id:, template:, published: nil, request_options: {})
        #
        # @param template_id [String] Path param: Id of the template to be created or updated.
        #
        # @param tenant_id [String] Path param: Id of the tenant for which to create or update the template.
        #
        # @param template [Courier::Models::TenantTemplateInput] Body param: Template configuration for creating or updating a tenant notificatio
        #
        # @param published [Boolean] Body param: Whether to publish the template immediately after saving. When true,
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Courier::Models::PutTenantTemplateResponse]
        #
        # @see Courier::Models::Tenants::TemplateReplaceParams
        def replace(template_id, params)
          parsed, options = Courier::Tenants::TemplateReplaceParams.dump_request(params)
          tenant_id =
            parsed.delete(:tenant_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :put,
            path: ["tenants/%1$s/templates/%2$s", tenant_id, template_id],
            body: parsed,
            model: Courier::PutTenantTemplateResponse,
            options: options
          )
        end

        # @api private
        #
        # @param client [Courier::Client]
        def initialize(client:)
          @client = client
          @versions = Courier::Resources::Tenants::Templates::Versions.new(client: client)
        end
      end
    end
  end
end
