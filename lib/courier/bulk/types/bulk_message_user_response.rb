# frozen_string_literal: true

module Courier
  module Bulk
    module Types
      class BulkMessageUserResponse < Internal::Types::Model
        field :status, -> { Courier::Bulk::Types::BulkJobUserStatus }, optional: false, nullable: false
        field :message_id, -> { String }, optional: true, nullable: false
      end
    end
  end
end
