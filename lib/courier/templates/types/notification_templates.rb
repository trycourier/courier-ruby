# frozen_string_literal: true

module Courier
  module Templates
    module Types
      class NotificationTemplates < Internal::Types::Model
        field :created_at, -> { Integer }, optional: false, nullable: false
        field :id, -> { String }, optional: false, nullable: false
        field :routing, -> { Courier::Templates::Types::RoutingStrategy }, optional: false, nullable: false
        field :tags, -> { Internal::Types::Array[Courier::Templates::Types::Tag] }, optional: false, nullable: false
        field :title, -> { String }, optional: false, nullable: false
        field :updated_at, -> { Integer }, optional: false, nullable: false
      end
    end
  end
end
