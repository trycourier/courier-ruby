# frozen_string_literal: true

module Courier
  module Notifications
    module Types
      class NotificationChannelContent < Internal::Types::Model
        field :subject, -> { String }, optional: true, nullable: false
        field :title, -> { String }, optional: true, nullable: false
      end
    end
  end
end
