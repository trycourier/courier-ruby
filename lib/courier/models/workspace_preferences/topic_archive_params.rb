# frozen_string_literal: true

module Courier
  module Models
    module WorkspacePreferences
      # @see Courier::Resources::WorkspacePreferences::Topics#archive
      class TopicArchiveParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        # @!attribute section_id
        #
        #   @return [String]
        required :section_id, String

        # @!attribute topic_id
        #
        #   @return [String]
        required :topic_id, String

        # @!method initialize(section_id:, topic_id:, request_options: {})
        #   @param section_id [String]
        #   @param topic_id [String]
        #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
