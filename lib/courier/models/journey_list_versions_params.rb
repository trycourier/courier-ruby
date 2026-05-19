# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Journeys#list_versions
    class JourneyListVersionsParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute template_id
      #
      #   @return [String]
      required :template_id, String

      # @!method initialize(template_id:, request_options: {})
      #   @param template_id [String]
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
