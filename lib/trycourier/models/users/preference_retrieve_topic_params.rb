# frozen_string_literal: true

module Trycourier
  module Models
    module Users
      # @see Trycourier::Resources::Users::Preferences#retrieve_topic
      class PreferenceRetrieveTopicParams < Trycourier::Internal::Type::BaseModel
        extend Trycourier::Internal::Type::RequestParameters::Converter
        include Trycourier::Internal::Type::RequestParameters

        # @!attribute user_id
        #
        #   @return [String]
        required :user_id, String

        # @!attribute tenant_id
        #   Query the preferences of a user for this specific tenant context.
        #
        #   @return [String, nil]
        optional :tenant_id, String, nil?: true

        # @!method initialize(user_id:, tenant_id: nil, request_options: {})
        #   @param user_id [String]
        #
        #   @param tenant_id [String, nil] Query the preferences of a user for this specific tenant context.
        #
        #   @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
