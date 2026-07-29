# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Profiles#create
    class ProfileCreateParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute user_id
      #
      #   @return [String]
      required :user_id, String

      # @!attribute profile
      #
      #   @return [Hash{Symbol=>Object}]
      required :profile, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown]

      # @!attribute idempotency_key
      #
      #   @return [String, nil]
      optional :idempotency_key, String

      # @!attribute x_idempotency_expiration
      #
      #   @return [String, nil]
      optional :x_idempotency_expiration, String

      # @!method initialize(user_id:, profile:, idempotency_key: nil, x_idempotency_expiration: nil, request_options: {})
      #   @param user_id [String]
      #   @param profile [Hash{Symbol=>Object}]
      #   @param idempotency_key [String]
      #   @param x_idempotency_expiration [String]
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
