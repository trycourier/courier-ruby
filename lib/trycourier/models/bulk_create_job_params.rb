# frozen_string_literal: true

module Trycourier
  module Models
    # @see Trycourier::Resources::Bulk#create_job
    class BulkCreateJobParams < Trycourier::Internal::Type::BaseModel
      extend Trycourier::Internal::Type::RequestParameters::Converter
      include Trycourier::Internal::Type::RequestParameters

      # @!attribute message
      #
      #   @return [Trycourier::Models::InboundBulkMessage::InboundBulkTemplateMessage, Trycourier::Models::InboundBulkMessage::InboundBulkContentMessage]
      required :message, union: -> { Trycourier::InboundBulkMessage }

      # @!method initialize(message:, request_options: {})
      #   @param message [Trycourier::Models::InboundBulkMessage::InboundBulkTemplateMessage, Trycourier::Models::InboundBulkMessage::InboundBulkContentMessage]
      #   @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
