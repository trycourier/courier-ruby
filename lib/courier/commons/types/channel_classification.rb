# frozen_string_literal: true

module Courier
  module Commons
    module Types
      module ChannelClassification
        extend Courier::Internal::Types::Enum

        DIRECT_MESSAGE = "direct_message"
        EMAIL = "email"
        PUSH = "push"
        SMS = "sms"
        WEBHOOK = "webhook"
        INBOX = "inbox"
      end
    end
  end
end
