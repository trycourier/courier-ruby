# frozen_string_literal: true

module Courier
  module Bulk
    module Types
      class JobDetails < Internal::Types::Model
        field :definition, -> { Courier::Bulk::Types::InboundBulkMessage }, optional: false, nullable: false
        field :enqueued, -> { Integer }, optional: false, nullable: false
        field :failures, -> { Integer }, optional: false, nullable: false
        field :received, -> { Integer }, optional: false, nullable: false
        field :status, -> { Courier::Bulk::Types::BulkJobStatus }, optional: false, nullable: false
      end
    end
  end
end
