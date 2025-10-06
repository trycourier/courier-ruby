# frozen_string_literal: true

module Courier
  module Models
    module Lists
      # @see Courier::Resources::Lists::Subscriptions#subscribe
      class SubscriptionSubscribeParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        # @!attribute recipients
        #
        #   @return [Array<Courier::Models::Lists::PutSubscriptionsRecipient>]
        required :recipients, -> { Courier::Internal::Type::ArrayOf[Courier::Lists::PutSubscriptionsRecipient] }

        # @!method initialize(recipients:, request_options: {})
        #   @param recipients [Array<Courier::Models::Lists::PutSubscriptionsRecipient>]
        #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
