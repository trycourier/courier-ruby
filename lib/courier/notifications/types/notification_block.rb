# frozen_string_literal: true

module Courier
  module Notifications
    module Types
      class NotificationBlock < Internal::Types::Model
        field :alias_, -> { String }, optional: true, nullable: false
        field :context, -> { String }, optional: true, nullable: false
        field :id, -> { String }, optional: false, nullable: false
        field :type, -> { Courier::Notifications::Types::BlockType }, optional: false, nullable: false
        field :content, -> { Courier::Notifications::Types::NotificationContent }, optional: true, nullable: false
        field :locales, lambda {
          Internal::Types::Hash[String, Courier::Notifications::Types::NotificationContent]
        }, optional: true, nullable: false
        field :checksum, -> { String }, optional: true, nullable: false
      end
    end
  end
end
