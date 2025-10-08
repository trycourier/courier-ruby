# frozen_string_literal: true

module Courier
  module Models
    module Lists
      # @see Courier::Resources::Lists::Subscriptions#subscribe_user
      class SubscriptionSubscribeUserParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        # @!attribute list_id
        #
        #   @return [String]
        required :list_id, String

        # @!attribute preferences
        #
        #   @return [Courier::Models::RecipientPreferences, nil]
        optional :preferences, -> { Courier::RecipientPreferences }, nil?: true

        # @!method initialize(list_id:, preferences: nil, request_options: {})
        #   @param list_id [String]
        #   @param preferences [Courier::Models::RecipientPreferences, nil]
        #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
