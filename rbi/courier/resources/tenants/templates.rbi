# typed: strong

module Courier
  module Resources
    class Tenants
      class Templates
        # Get a Template in Tenant
        sig do
          params(
            template_id: String,
            tenant_id: String,
            request_options: Courier::RequestOptions::OrHash
          ).returns(Courier::Models::Tenants::TemplateRetrieveResponse)
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

        # @api private
        sig { params(client: Courier::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
