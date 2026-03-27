# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Notifications#list_versions
    class NotificationListVersionsParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute cursor
      #   Opaque pagination cursor from a previous response. Omit for the first page.
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute limit
      #   Maximum number of versions to return per page. Default 10, max 10.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!method initialize(id:, cursor: nil, limit: nil, request_options: {})
      #   @param id [String]
      #
      #   @param cursor [String] Opaque pagination cursor from a previous response. Omit for the first page.
      #
      #   @param limit [Integer] Maximum number of versions to return per page. Default 10, max 10.
      #
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
