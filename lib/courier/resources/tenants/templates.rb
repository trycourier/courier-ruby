# frozen_string_literal: true

module Courier
  module Resources
    class Tenants
      class Templates
        # Get a Template in Tenant
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

        # List Templates in Tenant
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
          @client.request(
            method: :get,
            path: ["tenants/%1$s/templates", tenant_id],
            query: parsed,
            model: Courier::Models::Tenants::TemplateListResponse,
            options: options
          )
        end

        # @api private
        #
        # @param client [Courier::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
