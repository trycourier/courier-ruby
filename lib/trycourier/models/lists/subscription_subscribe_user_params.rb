# frozen_string_literal: true

module Trycourier
  module Models
    module Lists
      # @see Trycourier::Resources::Lists::Subscriptions#subscribe_user
      class SubscriptionSubscribeUserParams < Trycourier::Internal::Type::BaseModel
        extend Trycourier::Internal::Type::RequestParameters::Converter
        include Trycourier::Internal::Type::RequestParameters

        # @!attribute list_id
        #
        #   @return [String]
        required :list_id, String

        # @!attribute preferences
        #
        #   @return [Trycourier::Models::RecipientPreferences, nil]
        optional :preferences, -> { Trycourier::RecipientPreferences }, nil?: true

        # @!method initialize(list_id:, preferences: nil, request_options: {})
        #   @param list_id [String]
        #   @param preferences [Trycourier::Models::RecipientPreferences, nil]
        #   @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
