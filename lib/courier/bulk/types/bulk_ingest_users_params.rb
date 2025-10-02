# frozen_string_literal: true

module Courier
  module Bulk
    module Types
      class BulkIngestUsersParams < Internal::Types::Model
        field :users, lambda {
          Internal::Types::Array[Courier::Bulk::Types::InboundBulkMessageUser]
        }, optional: false, nullable: false
      end
    end
  end
end
