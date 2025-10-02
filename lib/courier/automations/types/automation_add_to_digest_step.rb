# frozen_string_literal: true

module Courier
  module Automations
    module Types
      class AutomationAddToDigestStep < Internal::Types::Model
        field :action, -> { String }, optional: false, nullable: false
        field :subscription_topic_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
