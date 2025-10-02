# frozen_string_literal: true

module Courier
  module Send
    module Types
      module RuleType
        extend Courier::Internal::Types::Enum

        SNOOZE = "snooze"
        CHANNEL_PREFERENCES = "channel_preferences"
        STATUS = "status"
      end
    end
  end
end
