# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Send#message
    class SendMessageParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute message
      #   Defines the message to be delivered
      #
      #   @return [Courier::Models::Message::ContentMessage, Courier::Models::Message::TemplateMessage]
      required :message, union: -> { Courier::Message }

      # @!method initialize(message:, request_options: {})
      #   @param message [Courier::Models::Message::ContentMessage, Courier::Models::Message::TemplateMessage] Defines the message to be delivered
      #
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
