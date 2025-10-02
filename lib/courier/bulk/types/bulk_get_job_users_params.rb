# frozen_string_literal: true

module Courier
  module Bulk
    module Types
      class BulkGetJobUsersParams < Internal::Types::Model
        field :job_id, -> { String }, optional: false, nullable: false
        field :cursor, -> { String }, optional: true, nullable: false
      end
    end
  end
end
