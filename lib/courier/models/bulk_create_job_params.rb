# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Bulk#create_job
    class BulkCreateJobParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute message
      #
      #   @return [Courier::Models::InboundBulkMessage::InboundBulkTemplateMessage, Courier::Models::InboundBulkMessage::InboundBulkContentMessage]
      required :message, union: -> { Courier::InboundBulkMessage }

      # @!method initialize(message:, request_options: {})
      #   @param message [Courier::Models::InboundBulkMessage::InboundBulkTemplateMessage, Courier::Models::InboundBulkMessage::InboundBulkContentMessage]
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
