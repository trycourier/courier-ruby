# frozen_string_literal: true

module Courier
  module Models
    module Journeys
      # @see Courier::Resources::Journeys::Templates#retrieve_content
      class TemplateRetrieveContentParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        # @!attribute template_id
        #
        #   @return [String]
        required :template_id, String

        # @!attribute notification_id
        #
        #   @return [String]
        required :notification_id, String

        # @!attribute version
        #   Accepts `draft`, `published`, or a version string (e.g., `v001`). Defaults to
        #   `published`.
        #
        #   @return [String, nil]
        optional :version, String

        # @!method initialize(template_id:, notification_id:, version: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Courier::Models::Journeys::TemplateRetrieveContentParams} for more details.
        #
        #   @param template_id [String]
        #
        #   @param notification_id [String]
        #
        #   @param version [String] Accepts `draft`, `published`, or a version string (e.g., `v001`). Defaults to `p
        #
        #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
