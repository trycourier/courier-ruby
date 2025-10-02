# frozen_string_literal: true

module Courier
  module AuditEvents
    module Types
      class AuditEvent < Internal::Types::Model
        field :actor, -> { Courier::AuditEvents::Types::Actor }, optional: true, nullable: false
        field :target, -> { Courier::AuditEvents::Types::Target }, optional: true, nullable: false
        field :audit_event_id, -> { String }, optional: false, nullable: false
        field :source, -> { String }, optional: false, nullable: false
        field :timestamp, -> { String }, optional: false, nullable: false
        field :type, -> { String }, optional: false, nullable: false
      end
    end
  end
end
