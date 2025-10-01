# frozen_string_literal: true

module Courier
  module Models
    module Users
      # @see Courier::Resources::Users::Tenants#add_single
      class TenantAddSingleParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        # @!attribute user_id
        #
        #   @return [String]
        required :user_id, String

        # @!attribute profile
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :profile, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown], nil?: true

        # @!method initialize(user_id:, profile: nil, request_options: {})
        #   @param user_id [String]
        #   @param profile [Hash{Symbol=>Object}, nil]
        #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
