# frozen_string_literal: true

module Courier
  module Notifications
    module Types
      class NotificationTagData < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :name, -> { String }, optional: false, nullable: false
      end
    end
  end
end
