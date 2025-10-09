# frozen_string_literal: true

module Trycourier
  module Models
    # @see Trycourier::Resources::Messages#history
    class MessageHistoryParams < Trycourier::Internal::Type::BaseModel
      extend Trycourier::Internal::Type::RequestParameters::Converter
      include Trycourier::Internal::Type::RequestParameters

      # @!attribute type
      #   A supported Message History type that will filter the events returned.
      #
      #   @return [String, nil]
      optional :type, String, nil?: true

      # @!method initialize(type: nil, request_options: {})
      #   @param type [String, nil] A supported Message History type that will filter the events returned.
      #
      #   @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
