# frozen_string_literal: true

module Courier
  module AuditEvents
    module Types
      class ListAuditEventsParams < Internal::Types::Model
        field :cursor, -> { String }, optional: true, nullable: false
      end
    end
  end
end
