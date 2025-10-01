# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Tenants#list
    class TenantListParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute cursor
      #   Continue the pagination with the next cursor
      #
      #   @return [String, nil]
      optional :cursor, String, nil?: true

      # @!attribute limit
      #   The number of tenants to return (defaults to 20, maximum value of 100)
      #
      #   @return [Integer, nil]
      optional :limit, Integer, nil?: true

      # @!attribute parent_tenant_id
      #   Filter the list of tenants by parent_id
      #
      #   @return [String, nil]
      optional :parent_tenant_id, String, nil?: true

      # @!method initialize(cursor: nil, limit: nil, parent_tenant_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::TenantListParams} for more details.
      #
      #   @param cursor [String, nil] Continue the pagination with the next cursor
      #
      #   @param limit [Integer, nil] The number of tenants to return
      #
      #   @param parent_tenant_id [String, nil] Filter the list of tenants by parent_id
      #
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
