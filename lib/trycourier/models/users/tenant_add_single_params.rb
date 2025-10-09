# frozen_string_literal: true

module Trycourier
  module Models
    module Users
      # @see Trycourier::Resources::Users::Tenants#add_single
      class TenantAddSingleParams < Trycourier::Internal::Type::BaseModel
        extend Trycourier::Internal::Type::RequestParameters::Converter
        include Trycourier::Internal::Type::RequestParameters

        # @!attribute user_id
        #
        #   @return [String]
        required :user_id, String

        # @!attribute profile
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :profile, Trycourier::Internal::Type::HashOf[Trycourier::Internal::Type::Unknown], nil?: true

        # @!method initialize(user_id:, profile: nil, request_options: {})
        #   @param user_id [String]
        #   @param profile [Hash{Symbol=>Object}, nil]
        #   @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
