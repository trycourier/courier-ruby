# frozen_string_literal: true

module Courier
  module Models
    module Users
      # @see Courier::Resources::Users::Tenants#add_multiple
      class TenantAddMultipleParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        # @!attribute user_id
        #
        #   @return [String]
        required :user_id, String

        # @!attribute tenants
        #
        #   @return [Array<Courier::Models::TenantAssociation>]
        required :tenants, -> { Courier::Internal::Type::ArrayOf[Courier::TenantAssociation] }

        # @!method initialize(user_id:, tenants:, request_options: {})
        #   @param user_id [String]
        #   @param tenants [Array<Courier::Models::TenantAssociation>]
        #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
