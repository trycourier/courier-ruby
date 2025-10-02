# frozen_string_literal: true

module Courier
  module Notifications
    module Types
      class Notification < Internal::Types::Model
        field :created_at, -> { Integer }, optional: false, nullable: false
        field :updated_at, -> { Integer }, optional: false, nullable: false
        field :id, -> { String }, optional: false, nullable: false
        field :routing, -> { Courier::Notifications::Types::MessageRouting }, optional: false, nullable: false
        field :tags, -> { Courier::Notifications::Types::NotificationTag }, optional: true, nullable: false
        field :title, -> { String }, optional: true, nullable: false
        field :topic_id, -> { String }, optional: false, nullable: false
        field :note, -> { String }, optional: false, nullable: false
      end
    end
  end
end
