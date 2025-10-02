# frozen_string_literal: true

module Courier
  module Notifications
    module Types
      class SubmissionChecksReplaceResponse < Internal::Types::Model
        field :checks, lambda {
          Internal::Types::Array[Courier::Notifications::Types::Check]
        }, optional: false, nullable: false
      end
    end
  end
end
