# frozen_string_literal: true

module Courier
  module Bulk
    module Types
      class BulkGetJobResponse < Internal::Types::Model
        field :job, -> { Courier::Bulk::Types::JobDetails }, optional: false, nullable: false
      end
    end
  end
end
