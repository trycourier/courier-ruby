# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Messages#history
    class MessageHistoryParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute type
      #   A supported Message History type that will filter the events returned.
      #
      #   @return [String, nil]
      optional :type, String, nil?: true

      # @!method initialize(type: nil, request_options: {})
      #   @param type [String, nil] A supported Message History type that will filter the events returned.
      #
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
