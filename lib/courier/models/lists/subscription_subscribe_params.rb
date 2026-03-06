# frozen_string_literal: true

module Courier
  module Models
    module Lists
      # @see Courier::Resources::Lists::Subscriptions#subscribe
      class SubscriptionSubscribeParams < Courier::Internal::Type::BaseModel
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

        # @!method initialize(list_id:, recipients:, request_options: {})
        #   @param list_id [String]
        #   @param recipients [Array<Courier::Models::PutSubscriptionsRecipient>]
        #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
