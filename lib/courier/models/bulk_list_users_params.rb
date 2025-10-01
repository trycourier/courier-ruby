# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Bulk#list_users
    class BulkListUsersParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute cursor
      #   A unique identifier that allows for fetching the next set of users added to the
      #   bulk job
      #
      #   @return [String, nil]
      optional :cursor, String, nil?: true

      # @!method initialize(cursor: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::BulkListUsersParams} for more details.
      #
      #   @param cursor [String, nil] A unique identifier that allows for fetching the next set of users added to the
      #
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
