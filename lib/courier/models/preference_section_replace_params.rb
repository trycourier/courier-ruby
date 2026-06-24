# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::PreferenceSections#replace
    class PreferenceSectionReplaceParams < Courier::Models::PreferenceSectionReplaceRequest
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
