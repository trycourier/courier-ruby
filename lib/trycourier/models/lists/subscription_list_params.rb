# frozen_string_literal: true

module Trycourier
  module Models
    module Lists
      # @see Trycourier::Resources::Lists::Subscriptions#list
      class SubscriptionListParams < Trycourier::Internal::Type::BaseModel
        extend Trycourier::Internal::Type::RequestParameters::Converter
        include Trycourier::Internal::Type::RequestParameters

        # @!attribute cursor
        #   A unique identifier that allows for fetching the next set of list subscriptions
        #
        #   @return [String, nil]
        optional :cursor, String, nil?: true

        # @!method initialize(cursor: nil, request_options: {})
        #   @param cursor [String, nil] A unique identifier that allows for fetching the next set of list subscriptions
        #
        #   @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
