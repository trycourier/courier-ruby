# frozen_string_literal: true

module Courier
  module Notifications
    module Types
      class BaseCheck < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :status, -> { Courier::Notifications::Types::CheckStatus }, optional: false, nullable: false
        field :type, -> { String }, optional: false, nullable: false
      end
    end
  end
end
