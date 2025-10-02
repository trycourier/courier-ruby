# frozen_string_literal: true

module Courier
  module AuditEvents
    module Types
      class GetAuditEventParams < Internal::Types::Model
        field :audit_event_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
