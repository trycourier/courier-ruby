# frozen_string_literal: true

module Trycourier
  module Models
    module Tenants
      module Preferences
        # @see Trycourier::Resources::Tenants::Preferences::Items#delete
        class ItemDeleteParams < Trycourier::Internal::Type::BaseModel
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
