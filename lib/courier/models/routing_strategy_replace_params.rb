# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::RoutingStrategies#replace
    class RoutingStrategyReplaceParams < Courier::Models::RoutingStrategyReplaceRequest
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!method initialize(id:, request_options: {})
      #   @param id [String]
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
