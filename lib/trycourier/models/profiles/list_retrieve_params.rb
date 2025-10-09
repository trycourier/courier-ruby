# frozen_string_literal: true

module Trycourier
  module Models
    module Profiles
      # @see Trycourier::Resources::Profiles::Lists#retrieve
      class ListRetrieveParams < Trycourier::Internal::Type::BaseModel
        extend Trycourier::Internal::Type::RequestParameters::Converter
        include Trycourier::Internal::Type::RequestParameters

        # @!attribute cursor
        #   A unique identifier that allows for fetching the next set of message statuses.
        #
        #   @return [String, nil]
        optional :cursor, String, nil?: true

        # @!method initialize(cursor: nil, request_options: {})
        #   @param cursor [String, nil] A unique identifier that allows for fetching the next set of message statuses.
        #
        #   @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
