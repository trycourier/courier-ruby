# frozen_string_literal: true

module Courier
  module Messages
    module Types
      class MessageDetails < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :status, -> { Courier::Messages::Types::MessageStatus }, optional: false, nullable: false
        field :enqueued, -> { Integer }, optional: false, nullable: false
        field :sent, -> { Integer }, optional: false, nullable: false
        field :delivered, -> { Integer }, optional: false, nullable: false
        field :opened, -> { Integer }, optional: false, nullable: false
        field :clicked, -> { Integer }, optional: false, nullable: false
        field :recipient, -> { String }, optional: false, nullable: false
        field :event, -> { String }, optional: false, nullable: false
        field :notification, -> { String }, optional: false, nullable: false
        field :error, -> { String }, optional: true, nullable: false
        field :reason, -> { Courier::Messages::Types::Reason }, optional: true, nullable: false
      end
    end
  end
end
