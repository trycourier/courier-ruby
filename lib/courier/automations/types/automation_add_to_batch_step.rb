# frozen_string_literal: true

module Courier
  module Automations
    module Types
      class AutomationAddToBatchStep < Internal::Types::Model
        field :action, -> { String }, optional: false, nullable: false
        field :wait_period, -> { String }, optional: false, nullable: false
        field :max_wait_period, -> { String }, optional: false, nullable: false
        field :max_items, lambda {
          Courier::Automations::Types::AutomationAddToBatchMaxItemsType
        }, optional: true, nullable: false
        field :retain, -> { Courier::Automations::Types::AutomationAddToBatchRetain }, optional: false, nullable: false
        field :scope, -> { Courier::Automations::Types::AutomationAddToBatchScope }, optional: true, nullable: false
        field :batch_key, -> { String }, optional: true, nullable: false
        field :batch_id, -> { String }, optional: true, nullable: false
        field :category_key, -> { String }, optional: true, nullable: false
      end
    end
  end
end
