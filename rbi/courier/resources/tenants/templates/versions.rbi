# typed: strong

module Courier
  module Resources
    class Tenants
      class Templates
        # Manage the templates and template versions scoped to a single tenant, including
        # the ones authored in the embedded designer.
        class Versions
          # Returns one version of a tenant template, addressed by version number or by
          # latest, with its content and publish timestamp.
          sig do
            params(
              version: String,
              tenant_id: String,
              template_id: String,
              request_options: Courier::RequestOptions::OrHash
            ).returns(Courier::BaseTemplateTenantAssociation)
          end
          def retrieve(
            # Version of the template to retrieve. Accepts "latest", "published", or a
            # specific version string (e.g., "v1", "v2").
            version,
            # Id of the tenant for which to retrieve the template.
            tenant_id:,
            # Id of the template to be retrieved.
            template_id:,
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
end
