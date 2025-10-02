# frozen_string_literal: true

module Courier
  module Bulk
    module Types
      class BulkIngestUsersResponse < Internal::Types::Model
        field :total, -> { Integer }, optional: false, nullable: false
        field :errors, lambda {
          Internal::Types::Array[Courier::Bulk::Types::BulkIngestError]
        }, optional: true, nullable: false
      end
    end
  end
end
