# frozen_string_literal: true

module Trycourier
  module Models
    # @see Trycourier::Resources::Tenants#list
    class TenantListParams < Trycourier::Internal::Type::BaseModel
      extend Trycourier::Internal::Type::RequestParameters::Converter
      include Trycourier::Internal::Type::RequestParameters

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
      #   {Trycourier::Models::TenantListParams} for more details.
      #
      #   @param cursor [String, nil] Continue the pagination with the next cursor
      #
      #   @param limit [Integer, nil] The number of tenants to return
      #
      #   @param parent_tenant_id [String, nil] Filter the list of tenants by parent_id
      #
      #   @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
