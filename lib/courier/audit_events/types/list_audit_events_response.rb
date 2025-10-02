# frozen_string_literal: true

module Courier
  module AuditEvents
    module Types
      class ListAuditEventsResponse < Internal::Types::Model
        field :paging, -> { Courier::Commons::Types::Paging }, optional: false, nullable: false
        field :results, lambda {
          Internal::Types::Array[Courier::AuditEvents::Types::AuditEvent]
        }, optional: false, nullable: false
      end
    end
  end
end
