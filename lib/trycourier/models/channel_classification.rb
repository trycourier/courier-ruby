# frozen_string_literal: true

module Trycourier
  module Models
    module ChannelClassification
      extend Trycourier::Internal::Type::Enum

      DIRECT_MESSAGE = :direct_message
      EMAIL = :email
      PUSH = :push
      SMS = :sms
      WEBHOOK = :webhook
      INBOX = :inbox

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
