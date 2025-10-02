# frozen_string_literal: true

module Courier
  module Notifications
    module Types
      class NotificationChannel < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :type, -> { String }, optional: true, nullable: false
        field :content, lambda {
          Courier::Notifications::Types::NotificationChannelContent
        }, optional: true, nullable: false
        field :locales, lambda {
          Internal::Types::Hash[String, Courier::Notifications::Types::NotificationChannelContent]
        }, optional: true, nullable: false
        field :checksum, -> { String }, optional: true, nullable: false
      end
    end
  end
end
