# frozen_string_literal: true

module Courier
  module Models
    module Tenants
      module Templates
        # @see Courier::Resources::Tenants::Templates::Versions#retrieve
        class VersionRetrieveParams < Courier::Internal::Type::BaseModel
          extend Courier::Internal::Type::RequestParameters::Converter
          include Courier::Internal::Type::RequestParameters

          # @!attribute tenant_id
          #
          #   @return [String]
          required :tenant_id, String

          # @!attribute template_id
          #
          #   @return [String]
          required :template_id, String

          # @!method initialize(tenant_id:, template_id:, request_options: {})
          #   @param tenant_id [String]
          #   @param template_id [String]
          #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
