# frozen_string_literal: true

module Courier
  module Send
    module Types
      class EmailFooter < Internal::Types::Model
        field :content, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
        field :inherit_default, -> { Internal::Types::Boolean }, optional: true, nullable: false
      end
    end
  end
end
