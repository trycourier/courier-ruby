# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Requests#archive
    class RequestArchiveParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute request_id
      #
      #   @return [String]
      required :request_id, String

      # @!method initialize(request_id:, request_options: {})
      #   @param request_id [String]
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
