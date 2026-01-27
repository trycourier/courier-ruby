# frozen_string_literal: true

module Courier
  module Models
    module Profiles
      # @see Courier::Resources::Profiles::Lists#subscribe
      class ListSubscribeParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        # @!attribute lists
        #
        #   @return [Array<Courier::Models::SubscribeToListsRequestItem>]
        required :lists, -> { Courier::Internal::Type::ArrayOf[Courier::SubscribeToListsRequestItem] }

        # @!method initialize(lists:, request_options: {})
        #   @param lists [Array<Courier::Models::SubscribeToListsRequestItem>]
        #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
