# frozen_string_literal: true

module Courier
  module Models
    module PreferenceSections
      # @see Courier::Resources::PreferenceSections::Topics#list
      class TopicListParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        # @!attribute section_id
        #
        #   @return [String]
        required :section_id, String

        # @!method initialize(section_id:, request_options: {})
        #   @param section_id [String]
        #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
