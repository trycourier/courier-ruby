# frozen_string_literal: true

module Trycourier
  module Models
    # @see Trycourier::Resources::Bulk#create_job
    class BulkCreateJobParams < Trycourier::Internal::Type::BaseModel
      extend Trycourier::Internal::Type::RequestParameters::Converter
      include Trycourier::Internal::Type::RequestParameters

      # @!attribute message
      #   Bulk message definition. Supports two formats:
      #
      #   - V1 format: Requires `event` field (event ID or notification ID)
      #   - V2 format: Optionally use `template` (notification ID) or `content` (Elemental
      #     content) in addition to `event`
      #
      #   @return [Trycourier::Models::InboundBulkMessage]
      required :message, -> { Trycourier::InboundBulkMessage }

      # @!method initialize(message:, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Trycourier::Models::BulkCreateJobParams} for more details.
      #
      #   @param message [Trycourier::Models::InboundBulkMessage] Bulk message definition. Supports two formats:
      #
      #   @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
