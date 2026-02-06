# typed: strong

module Courier
  module Resources
    class Tenants
      class Templates
        class Versions
          # Fetches a specific version of a tenant template.
          #
          # Supports the following version formats:
          #
          # - `latest` - The most recent version of the template
          # - `published` - The currently published version
          # - `v{version}` - A specific version (e.g., "v1", "v2", "v1.0.0")
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
