# frozen_string_literal: true

module Courier
  module Models
    module Tenants
      module DefaultPreferences
        module ChannelClassification
          extend Courier::Internal::Type::Enum

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
  end
end
