# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Tenants#delete
    class TenantDeleteParams < Courier::Internal::Type::BaseModel
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
