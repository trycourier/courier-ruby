# frozen_string_literal: true

module Courier
  module Bulk
    module Types
      # The message property has the following primary top-level properties. They define the destination and content of the message.
      # Additional advanced configuration fields [are defined below](https://www.courier.com/docs/reference/send/message/#other-message-properties).
      class InboundBulkContentMessage < Internal::Types::Model
        field :content, -> { Courier::Send::Types::Content }, optional: false, nullable: false
      end
    end
  end
end
