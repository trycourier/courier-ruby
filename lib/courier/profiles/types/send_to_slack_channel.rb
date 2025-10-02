# frozen_string_literal: true

module Courier
  module Profiles
    module Types
      class SendToSlackChannel < Internal::Types::Model
        field :channel, -> { String }, optional: false, nullable: false
      end
    end
  end
end
