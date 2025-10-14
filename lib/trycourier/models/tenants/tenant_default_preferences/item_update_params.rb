# frozen_string_literal: true

module Trycourier
  module Models
    module Tenants
      module TenantDefaultPreferences
        # @see Trycourier::Resources::Tenants::TenantDefaultPreferences::Items#update
        class ItemUpdateParams < Trycourier::Models::SubscriptionTopicNew
          extend Trycourier::Internal::Type::RequestParameters::Converter
          include Trycourier::Internal::Type::RequestParameters

          # @!attribute tenant_id
          #
          #   @return [String]
          required :tenant_id, String

          # @!method initialize(tenant_id:, request_options: {})
          #   @param tenant_id [String]
          #   @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
