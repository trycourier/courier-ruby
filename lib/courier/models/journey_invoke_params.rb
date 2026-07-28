# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Journeys#invoke
    class JourneyInvokeParams < Courier::Models::JourneysInvokeRequest
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute template_id
      #
      #   @return [String]
      required :template_id, String

      # @!attribute idempotency_key
      #
      #   @return [String, nil]
      optional :idempotency_key, String

      # @!attribute x_idempotency_expiration
      #
      #   @return [String, nil]
      optional :x_idempotency_expiration, String

      # @!method initialize(template_id:, idempotency_key: nil, x_idempotency_expiration: nil, request_options: {})
      #   @param template_id [String]
      #   @param idempotency_key [String]
      #   @param x_idempotency_expiration [String]
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
