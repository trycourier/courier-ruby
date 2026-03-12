# frozen_string_literal: true

module Courier
  module Models
    module Users
      # @see Courier::Resources::Users::Tenants#remove_single
      class TenantRemoveSingleParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        # @!attribute user_id
        #
        #   @return [String]
        required :user_id, String

        # @!attribute tenant_id
        #
        #   @return [String]
        required :tenant_id, String

        # @!method initialize(user_id:, tenant_id:, request_options: {})
        #   @param user_id [String]
        #   @param tenant_id [String]
        #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
