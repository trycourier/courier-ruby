# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Notifications#publish
    class NotificationPublishParams < Courier::Models::NotificationTemplatePublishRequest
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute idempotency_key
      #
      #   @return [String, nil]
      optional :idempotency_key, String

      # @!attribute x_idempotency_expiration
      #
      #   @return [String, nil]
      optional :x_idempotency_expiration, String

      # @!method initialize(id:, idempotency_key: nil, x_idempotency_expiration: nil, request_options: {})
      #   @param id [String]
      #   @param idempotency_key [String]
      #   @param x_idempotency_expiration [String]
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
