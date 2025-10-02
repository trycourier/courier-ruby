# frozen_string_literal: true

module Courier
  module Bulk
    module Types
      class BulkCreateJobParams < Internal::Types::Model
        field :message, -> { Courier::Bulk::Types::InboundBulkMessage }, optional: false, nullable: false
      end
    end
  end
end
