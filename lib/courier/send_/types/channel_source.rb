# frozen_string_literal: true

module Courier
  module Send
    module Types
      module ChannelSource
        extend Courier::Internal::Types::Enum

        SUBSCRIPTION = "subscription"
        LIST = "list"
        RECIPIENT = "recipient"
      end
    end
  end
end
