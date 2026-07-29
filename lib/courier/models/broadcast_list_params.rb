# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Broadcasts#list
    class BroadcastListParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute cursor
      #   Opaque pagination cursor from a previous response. Omit for the first page.
      #
      #   @return [String, nil]
      optional :cursor, String, nil?: true

      # @!attribute limit
      #   Maximum number of results per page.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!method initialize(cursor: nil, limit: nil, request_options: {})
      #   @param cursor [String, nil] Opaque pagination cursor from a previous response. Omit for the first page.
      #
      #   @param limit [Integer] Maximum number of results per page.
      #
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
