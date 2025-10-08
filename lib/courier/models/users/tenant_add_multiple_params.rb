# frozen_string_literal: true

module Courier
  module Models
    module Users
      # @see Courier::Resources::Users::Tenants#add_multiple
      class TenantAddMultipleParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        # @!attribute tenants
        #
        #   @return [Array<Courier::Models::TenantAssociation>]
        required :tenants, -> { Courier::Internal::Type::ArrayOf[Courier::TenantAssociation] }

        # @!method initialize(tenants:, request_options: {})
        #   @param tenants [Array<Courier::Models::TenantAssociation>]
        #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
