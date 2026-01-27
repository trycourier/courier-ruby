# frozen_string_literal: true

module Courier
  module Models
    module Lists
      # @see Courier::Resources::Lists::Subscriptions#list
      class SubscriptionListParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        # @!attribute cursor
        #   A unique identifier that allows for fetching the next set of list subscriptions
        #
        #   @return [String, nil]
        optional :cursor, String, nil?: true

        # @!method initialize(cursor: nil, request_options: {})
        #   @param cursor [String, nil] A unique identifier that allows for fetching the next set of list subscriptions
        #
        #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
