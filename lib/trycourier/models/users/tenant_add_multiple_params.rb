# frozen_string_literal: true

module Trycourier
  module Models
    module Users
      # @see Trycourier::Resources::Users::Tenants#add_multiple
      class TenantAddMultipleParams < Trycourier::Internal::Type::BaseModel
        extend Trycourier::Internal::Type::RequestParameters::Converter
        include Trycourier::Internal::Type::RequestParameters

        # @!attribute tenants
        #
        #   @return [Array<Trycourier::Models::TenantAssociation>]
        required :tenants, -> { Trycourier::Internal::Type::ArrayOf[Trycourier::TenantAssociation] }

        # @!method initialize(tenants:, request_options: {})
        #   @param tenants [Array<Trycourier::Models::TenantAssociation>]
        #   @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
