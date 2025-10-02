# frozen_string_literal: true

module Courier
  module Send
    module Types
      class TemplateMessage < Internal::Types::Model
        field :template, -> { String }, optional: false, nullable: false
      end
    end
  end
end
