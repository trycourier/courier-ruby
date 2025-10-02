# frozen_string_literal: true

module Courier
  module Bulk
    module Types
      class BulkGetJobParams < Internal::Types::Model
        field :job_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
