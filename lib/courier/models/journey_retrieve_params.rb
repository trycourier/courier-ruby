# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Journeys#retrieve
    class JourneyRetrieveParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute template_id
      #
      #   @return [String]
      required :template_id, String

      # @!attribute version
      #   Version selector: `draft`, `published` (default), or `vN`.
      #
      #   @return [String, nil]
      optional :version, String

      # @!method initialize(template_id:, version: nil, request_options: {})
      #   @param template_id [String]
      #
      #   @param version [String] Version selector: `draft`, `published` (default), or `vN`.
      #
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
