# frozen_string_literal: true

module Courier
  module Send
    module Types
      class Icons < Internal::Types::Model
        field :bell, -> { String }, optional: true, nullable: false
        field :message, -> { String }, optional: true, nullable: false
      end
    end
  end
end
