# frozen_string_literal: true

module Courier
  module Automations
    module Types
      class AutomationFetchDataStep < Internal::Types::Model
        field :action, -> { String }, optional: false, nullable: false
        field :webhook, -> { Courier::Automations::Types::AutomationFetchDataWebhook }, optional: false, nullable: false
        field :merge_strategy, -> { Courier::Automations::Types::MergeAlgorithm }, optional: false, nullable: false
        field :idempotency_expiry, -> { String }, optional: true, nullable: false
        field :idempotency_key, -> { String }, optional: true, nullable: false
      end
    end
  end
end
