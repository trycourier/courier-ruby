# frozen_string_literal: true

module Courier
  module Messages
    module Types
      class ListMessagesRequest < Internal::Types::Model
        field :archived, -> { Internal::Types::Boolean }, optional: true, nullable: false
        field :cursor, -> { String }, optional: true, nullable: false
        field :event, -> { String }, optional: true, nullable: false
        field :list, -> { String }, optional: true, nullable: false
        field :message_id, -> { String }, optional: true, nullable: false
        field :notification, -> { String }, optional: true, nullable: false
        field :provider, -> { String }, optional: true, nullable: false
        field :recipient, -> { String }, optional: true, nullable: false
        field :status, -> { String }, optional: true, nullable: false
        field :tag, -> { String }, optional: true, nullable: false
        field :tags, -> { String }, optional: true, nullable: false
        field :tenant_id, -> { String }, optional: true, nullable: false
        field :enqueued_after, -> { String }, optional: true, nullable: false
        field :trace_id, -> { String }, optional: true, nullable: false
      end
    end
  end
end
