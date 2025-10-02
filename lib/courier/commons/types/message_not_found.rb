# frozen_string_literal: true

module Courier
  module Commons
    module Types
      class MessageNotFound < Internal::Types::Model
        field :type, -> { String }, optional: false, nullable: false
      end
    end
  end
end
