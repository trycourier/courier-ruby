# frozen_string_literal: true

module Trycourier
  module Models
    module Profiles
      # @see Trycourier::Resources::Profiles::Lists#subscribe
      class ListSubscribeParams < Trycourier::Internal::Type::BaseModel
        extend Trycourier::Internal::Type::RequestParameters::Converter
        include Trycourier::Internal::Type::RequestParameters

        # @!attribute lists
        #
        #   @return [Array<Trycourier::Models::SubscribeToListsRequestItem>]
        required :lists, -> { Trycourier::Internal::Type::ArrayOf[Trycourier::SubscribeToListsRequestItem] }

        # @!method initialize(lists:, request_options: {})
        #   @param lists [Array<Trycourier::Models::SubscribeToListsRequestItem>]
        #   @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
