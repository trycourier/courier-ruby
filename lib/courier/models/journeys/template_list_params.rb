# frozen_string_literal: true

module Courier
  module Models
    module Journeys
      # @see Courier::Resources::Journeys::Templates#list
      class TemplateListParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        # @!attribute template_id
        #
        #   @return [String]
        required :template_id, String

        # @!attribute cursor
        #
        #   @return [String, nil]
        optional :cursor, String

        # @!attribute limit
        #
        #   @return [Integer, nil]
        optional :limit, Integer

        # @!method initialize(template_id:, cursor: nil, limit: nil, request_options: {})
        #   @param template_id [String]
        #   @param cursor [String]
        #   @param limit [Integer]
        #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
