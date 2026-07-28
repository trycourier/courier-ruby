# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Journeys#create
    class JourneyCreateParams < Courier::Models::CreateJourneyRequest
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute idempotency_key
      #
      #   @return [String, nil]
      optional :idempotency_key, String

      # @!attribute x_idempotency_expiration
      #
      #   @return [String, nil]
      optional :x_idempotency_expiration, String

      # @!method initialize(idempotency_key: nil, x_idempotency_expiration: nil, request_options: {})
      #   @param idempotency_key [String]
      #   @param x_idempotency_expiration [String]
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
