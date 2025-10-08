# frozen_string_literal: true

module Courier
  module Models
    module Lists
      # @see Courier::Resources::Lists::Subscriptions#add
      class SubscriptionAddParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        # @!attribute recipients
        #
        #   @return [Array<Courier::Models::PutSubscriptionsRecipient>]
        required :recipients, -> { Courier::Internal::Type::ArrayOf[Courier::PutSubscriptionsRecipient] }

        # @!method initialize(recipients:, request_options: {})
        #   @param recipients [Array<Courier::Models::PutSubscriptionsRecipient>]
        #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
