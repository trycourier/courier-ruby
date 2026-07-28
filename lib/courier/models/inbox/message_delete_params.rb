# frozen_string_literal: true

module Courier
  module Models
    module Inbox
      # @see Courier::Resources::Inbox::Messages#delete
      class MessageDeleteParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        # @!attribute message_id
        #
        #   @return [String]
        required :message_id, String

        # @!method initialize(message_id:, request_options: {})
        #   @param message_id [String]
        #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
