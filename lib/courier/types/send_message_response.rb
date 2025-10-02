# frozen_string_literal: true

module Courier
  module Types
    class SendMessageResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
