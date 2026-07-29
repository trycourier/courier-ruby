# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Broadcasts#retrieve_content
    class BroadcastRetrieveContentParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute broadcast_id
      #
      #   @return [String]
      required :broadcast_id, String

      # @!attribute version
      #   Accepts `draft`, `published`, or a version string (e.g. `v001`). Defaults to
      #   `draft`.
      #
      #   @return [String, nil]
      optional :version, String

      # @!method initialize(broadcast_id:, version: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::BroadcastRetrieveContentParams} for more details.
      #
      #   @param broadcast_id [String]
      #
      #   @param version [String] Accepts `draft`, `published`, or a version string (e.g. `v001`). Defaults to `dr
      #
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
