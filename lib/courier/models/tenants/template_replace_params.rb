# frozen_string_literal: true

module Courier
  module Models
    module Tenants
      # @see Courier::Resources::Tenants::Templates#replace
      class TemplateReplaceParams < Courier::Models::PutTenantTemplateRequest
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        # @!attribute tenant_id
        #
        #   @return [String]
        required :tenant_id, String

        # @!method initialize(tenant_id:, request_options: {})
        #   @param tenant_id [String]
        #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
