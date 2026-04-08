# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Notifications#put_element
    class NotificationPutElementParams < Courier::Models::NotificationElementPutRequest
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute element_id
      #
      #   @return [String]
      required :element_id, String

      # @!method initialize(id:, element_id:, request_options: {})
      #   @param id [String]
      #   @param element_id [String]
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
