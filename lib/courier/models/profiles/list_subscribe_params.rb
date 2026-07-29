# frozen_string_literal: true

module Courier
  module Models
    module Profiles
      # @see Courier::Resources::Profiles::Lists#subscribe
      class ListSubscribeParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        # @!attribute user_id
        #
        #   @return [String]
        required :user_id, String

        # @!attribute lists
        #
        #   @return [Array<Courier::Models::SubscribeToListsRequestItem>]
        required :lists, -> { Courier::Internal::Type::ArrayOf[Courier::SubscribeToListsRequestItem] }

        # @!attribute idempotency_key
        #
        #   @return [String, nil]
        optional :idempotency_key, String

        # @!attribute x_idempotency_expiration
        #
        #   @return [String, nil]
        optional :x_idempotency_expiration, String

        # @!method initialize(user_id:, lists:, idempotency_key: nil, x_idempotency_expiration: nil, request_options: {})
        #   @param user_id [String]
        #   @param lists [Array<Courier::Models::SubscribeToListsRequestItem>]
        #   @param idempotency_key [String]
        #   @param x_idempotency_expiration [String]
        #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
