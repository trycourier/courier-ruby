# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Notifications#retrieve_content
    class NotificationRetrieveContentParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute version
      #   Accepts `draft`, `published`, or a version string (e.g., `v001`). Defaults to
      #   `published`.
      #
      #   @return [String, nil]
      optional :version, String

      # @!method initialize(id:, version: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::NotificationRetrieveContentParams} for more details.
      #
      #   @param id [String]
      #
      #   @param version [String] Accepts `draft`, `published`, or a version string (e.g., `v001`). Defaults to `p
      #
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
