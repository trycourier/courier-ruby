# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Broadcasts#put_content
    class BroadcastPutContentParams < Courier::Models::NotificationContentPutRequest
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute broadcast_id
      #
      #   @return [String]
      required :broadcast_id, String

      # @!method initialize(broadcast_id:, request_options: {})
      #   @param broadcast_id [String]
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
