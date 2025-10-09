# frozen_string_literal: true

module Trycourier
  module Models
    # @see Trycourier::Resources::Bulk#list_users
    class BulkListUsersParams < Trycourier::Internal::Type::BaseModel
      extend Trycourier::Internal::Type::RequestParameters::Converter
      include Trycourier::Internal::Type::RequestParameters

      # @!attribute cursor
      #   A unique identifier that allows for fetching the next set of users added to the
      #   bulk job
      #
      #   @return [String, nil]
      optional :cursor, String, nil?: true

      # @!method initialize(cursor: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Trycourier::Models::BulkListUsersParams} for more details.
      #
      #   @param cursor [String, nil] A unique identifier that allows for fetching the next set of users added to the
      #
      #   @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
