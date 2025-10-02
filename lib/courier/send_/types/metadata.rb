# frozen_string_literal: true

module Courier
  module Send
    module Types
      class Metadata < Internal::Types::Model
        field :utm, -> { Courier::Send::Types::Utm }, optional: true, nullable: false
      end
    end
  end
end
