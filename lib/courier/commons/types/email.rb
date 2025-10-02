# frozen_string_literal: true

module Courier
  module Commons
    module Types
      class Email < Internal::Types::Model
        field :footer, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
        field :header, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
      end
    end
  end
end
