# frozen_string_literal: true

module Trycourier
  module Models
    module Lists
      # @see Trycourier::Resources::Lists::Subscriptions#unsubscribe_user
      class SubscriptionUnsubscribeUserParams < Trycourier::Internal::Type::BaseModel
        extend Trycourier::Internal::Type::RequestParameters::Converter
        include Trycourier::Internal::Type::RequestParameters

        # @!attribute list_id
        #
        #   @return [String]
        required :list_id, String

        # @!method initialize(list_id:, request_options: {})
        #   @param list_id [String]
        #   @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
