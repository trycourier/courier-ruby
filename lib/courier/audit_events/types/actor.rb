# frozen_string_literal: true

module Courier
  module AuditEvents
    module Types
      class Actor < Internal::Types::Model
        field :id, -> { String }, optional: true, nullable: false
        field :email, -> { String }, optional: true, nullable: false
      end
    end
  end
end
