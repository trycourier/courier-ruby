# frozen_string_literal: true

module Courier
  module Automations
    module Types
      class AutomationFetchDataWebhook < Internal::Types::Model
        field :body, lambda {
          Internal::Types::Hash[String, Internal::Types::Hash[String, Object]]
        }, optional: true, nullable: false
        field :headers, lambda {
          Internal::Types::Hash[String, Internal::Types::Hash[String, Object]]
        }, optional: true, nullable: false
        field :params, lambda {
          Internal::Types::Hash[String, Internal::Types::Hash[String, Object]]
        }, optional: true, nullable: false
        field :method_, lambda {
          Courier::Automations::Types::AutomationFetchDataWebhookMethod
        }, optional: false, nullable: false
        field :url, -> { String }, optional: false, nullable: false
      end
    end
  end
end
