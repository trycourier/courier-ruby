# frozen_string_literal: true

module Trycourier
  module Models
    module Users
      # @see Trycourier::Resources::Users::Preferences#retrieve
      class PreferenceRetrieveParams < Trycourier::Internal::Type::BaseModel
        extend Trycourier::Internal::Type::RequestParameters::Converter
        include Trycourier::Internal::Type::RequestParameters

        # @!attribute tenant_id
        #   Query the preferences of a user for this specific tenant context.
        #
        #   @return [String, nil]
        optional :tenant_id, String, nil?: true

        # @!method initialize(tenant_id: nil, request_options: {})
        #   @param tenant_id [String, nil] Query the preferences of a user for this specific tenant context.
        #
        #   @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
