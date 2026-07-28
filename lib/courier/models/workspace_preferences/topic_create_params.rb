# frozen_string_literal: true

module Courier
  module Models
    module WorkspacePreferences
      # @see Courier::Resources::WorkspacePreferences::Topics#create
      class TopicCreateParams < Courier::Models::WorkspacePreferenceTopicCreateRequest
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        # @!attribute section_id
        #
        #   @return [String]
        required :section_id, String

        # @!attribute idempotency_key
        #
        #   @return [String, nil]
        optional :idempotency_key, String

        # @!attribute x_idempotency_expiration
        #
        #   @return [String, nil]
        optional :x_idempotency_expiration, String

        # @!method initialize(section_id:, idempotency_key: nil, x_idempotency_expiration: nil, request_options: {})
        #   @param section_id [String]
        #   @param idempotency_key [String]
        #   @param x_idempotency_expiration [String]
        #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
