# frozen_string_literal: true

module Courier
  module Resources
    class Tenants
      class Templates
        class Versions
          # Some parameter documentations has been truncated, see
          # {Courier::Models::Tenants::Templates::VersionRetrieveParams} for more details.
          #
          # Returns one version of a tenant template, addressed by version number or by
          # latest, with its content and publish timestamp.
          #
          # @overload retrieve(version, tenant_id:, template_id:, request_options: {})
          #
          # @param version [String] Version of the template to retrieve. Accepts "latest", "published", or a specifi
          #
          # @param tenant_id [String] Id of the tenant for which to retrieve the template.
          #
          # @param template_id [String] Id of the template to be retrieved.
          #
          # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Courier::Models::BaseTemplateTenantAssociation]
          #
          # @see Courier::Models::Tenants::Templates::VersionRetrieveParams
          def retrieve(version, params)
            parsed, options = Courier::Tenants::Templates::VersionRetrieveParams.dump_request(params)
            tenant_id =
              parsed.delete(:tenant_id) do
                raise ArgumentError.new("missing required path argument #{_1}")
              end
            template_id =
              parsed.delete(:template_id) do
                raise ArgumentError.new("missing required path argument #{_1}")
              end
            @client.request(
              method: :get,
              path: ["tenants/%1$s/templates/%2$s/versions/%3$s", tenant_id, template_id, version],
              model: Courier::BaseTemplateTenantAssociation,
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
end
