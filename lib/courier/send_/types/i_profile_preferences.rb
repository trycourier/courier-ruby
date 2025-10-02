# frozen_string_literal: true

module Courier
  module Send
    module Types
      class IProfilePreferences < Internal::Types::Model
        field :categories, lambda {
          Internal::Types::Hash[String, Courier::Send::Types::Preference]
        }, optional: true, nullable: false
        field :notifications, lambda {
          Internal::Types::Hash[String, Courier::Send::Types::Preference]
        }, optional: false, nullable: false
        field :template_id, -> { String }, optional: true, nullable: false
      end
    end
  end
end
