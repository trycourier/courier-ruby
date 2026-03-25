# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Notifications#retrieve
    class NotificationRetrieveParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute version
      #   Version to retrieve. One of "draft", "published", or a version string like
      #   "v001". Defaults to "published".
      #
      #   @return [String, nil]
      optional :version, String

      # @!method initialize(id:, version: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::NotificationRetrieveParams} for more details.
      #
      #   @param id [String]
      #
      #   @param version [String] Version to retrieve. One of "draft", "published", or a version string like "v001
      #
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
