# frozen_string_literal: true

module Courier
  module Notifications
    module Types
      class SubmissionChecksReplaceParams < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :submission_id, -> { String }, optional: false, nullable: false
        field :checks, lambda {
          Internal::Types::Array[Courier::Notifications::Types::BaseCheck]
        }, optional: false, nullable: false
      end
    end
  end
end
