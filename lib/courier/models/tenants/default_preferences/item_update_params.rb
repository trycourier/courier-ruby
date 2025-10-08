# frozen_string_literal: true

module Courier
  module Models
    module Tenants
      module DefaultPreferences
        # @see Courier::Resources::Tenants::DefaultPreferences::Items#update
        class ItemUpdateParams < Courier::Models::SubscriptionTopicNew
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
end
