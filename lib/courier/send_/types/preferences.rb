# frozen_string_literal: true

module Courier
  module Send
    module Types
      class Preferences < Internal::Types::Model
        field :template_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false
      end
    end
  end
end
