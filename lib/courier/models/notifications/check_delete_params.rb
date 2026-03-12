# frozen_string_literal: true

module Courier
  module Models
    module Notifications
      # @see Courier::Resources::Notifications::Checks#delete
      class CheckDeleteParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute submission_id
        #
        #   @return [String]
        required :submission_id, String

        # @!method initialize(id:, submission_id:, request_options: {})
        #   @param id [String]
        #   @param submission_id [String]
        #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
