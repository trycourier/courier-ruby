# frozen_string_literal: true

module Courier
  module Profiles
    module Types
      class SnoozeRule < Internal::Types::Model
        field :type, -> { Courier::Profiles::Types::SnoozeRuleType }, optional: false, nullable: false
        field :start, -> { String }, optional: false, nullable: false
        field :until_, -> { String }, optional: false, nullable: false
      end
    end
  end
end
