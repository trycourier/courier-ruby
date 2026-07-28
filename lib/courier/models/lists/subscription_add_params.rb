# frozen_string_literal: true

module Courier
  module Models
    module Lists
      # @see Courier::Resources::Lists::Subscriptions#add
      class SubscriptionAddParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        # @!attribute list_id
        #
        #   @return [String]
        required :list_id, String

        # @!attribute recipients
        #
        #   @return [Array<Courier::Models::PutSubscriptionsRecipient>]
        required :recipients, -> { Courier::Internal::Type::ArrayOf[Courier::PutSubscriptionsRecipient] }

        # @!attribute idempotency_key
        #
        #   @return [String, nil]
        optional :idempotency_key, String

        # @!attribute x_idempotency_expiration
        #
        #   @return [String, nil]
        optional :x_idempotency_expiration, String

        # @!method initialize(list_id:, recipients:, idempotency_key: nil, x_idempotency_expiration: nil, request_options: {})
        #   @param list_id [String]
        #   @param recipients [Array<Courier::Models::PutSubscriptionsRecipient>]
        #   @param idempotency_key [String]
        #   @param x_idempotency_expiration [String]
        #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
