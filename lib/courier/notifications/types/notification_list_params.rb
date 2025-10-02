# frozen_string_literal: true

module Courier
  module Notifications
    module Types
      class NotificationListParams < Internal::Types::Model
        field :cursor, -> { String }, optional: true, nullable: false
        field :notes, -> { Internal::Types::Boolean }, optional: true, nullable: false
      end
    end
  end
end
