# frozen_string_literal: true

module Courier
  module Send
    module Types
      class MessageContext < Internal::Types::Model
        field :tenant_id, -> { String }, optional: true, nullable: false
      end
    end
  end
end
