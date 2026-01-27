# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Bulk#create_job
    class BulkCreateJobParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute message
      #   Bulk message definition. Supports two formats:
      #
      #   - V1 format: Requires `event` field (event ID or notification ID)
      #   - V2 format: Optionally use `template` (notification ID) or `content` (Elemental
      #     content) in addition to `event`
      #
      #   @return [Courier::Models::InboundBulkMessage]
      required :message, -> { Courier::InboundBulkMessage }

      # @!method initialize(message:, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::BulkCreateJobParams} for more details.
      #
      #   @param message [Courier::Models::InboundBulkMessage] Bulk message definition. Supports two formats:
      #
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
