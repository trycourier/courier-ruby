# frozen_string_literal: true

module Courier
  module Models
    module Profiles
      # @see Courier::Resources::Profiles::Lists#retrieve
      class ListRetrieveParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        # @!attribute user_id
        #
        #   @return [String]
        required :user_id, String

        # @!attribute cursor
        #   A unique identifier that allows for fetching the next set of message statuses.
        #
        #   @return [String, nil]
        optional :cursor, String, nil?: true

        # @!method initialize(user_id:, cursor: nil, request_options: {})
        #   @param user_id [String]
        #
        #   @param cursor [String, nil] A unique identifier that allows for fetching the next set of message statuses.
        #
        #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
