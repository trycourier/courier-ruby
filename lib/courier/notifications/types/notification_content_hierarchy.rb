# frozen_string_literal: true

module Courier
  module Notifications
    module Types
      class NotificationContentHierarchy < Internal::Types::Model
        field :parent, -> { String }, optional: true, nullable: false
        field :children, -> { String }, optional: true, nullable: false
      end
    end
  end
end
