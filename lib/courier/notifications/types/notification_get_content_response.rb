# frozen_string_literal: true

module Courier
  module Notifications
    module Types
      class NotificationGetContentResponse < Internal::Types::Model
        field :blocks, lambda {
          Internal::Types::Array[Courier::Notifications::Types::NotificationBlock]
        }, optional: true, nullable: false
        field :channels, lambda {
          Internal::Types::Array[Courier::Notifications::Types::NotificationChannel]
        }, optional: true, nullable: false
        field :checksum, -> { String }, optional: true, nullable: false
      end
    end
  end
end
