# frozen_string_literal: true

module Trycourier
  module Models
    module Lists
      # @see Trycourier::Resources::Lists::Subscriptions#add
      class SubscriptionAddParams < Trycourier::Internal::Type::BaseModel
        extend Trycourier::Internal::Type::RequestParameters::Converter
        include Trycourier::Internal::Type::RequestParameters

        # @!attribute recipients
        #
        #   @return [Array<Trycourier::Models::PutSubscriptionsRecipient>]
        required :recipients, -> { Trycourier::Internal::Type::ArrayOf[Trycourier::PutSubscriptionsRecipient] }

        # @!method initialize(recipients:, request_options: {})
        #   @param recipients [Array<Trycourier::Models::PutSubscriptionsRecipient>]
        #   @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
