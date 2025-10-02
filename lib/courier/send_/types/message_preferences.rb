# frozen_string_literal: true

module Courier
  module Send
    module Types
      class MessagePreferences < Internal::Types::Model
        field :subscription_topic_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
