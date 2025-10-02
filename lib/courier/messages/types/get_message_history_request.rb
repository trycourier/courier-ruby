# frozen_string_literal: true

module Courier
  module Messages
    module Types
      class GetMessageHistoryRequest < Internal::Types::Model
        field :message_id, -> { String }, optional: false, nullable: false
        field :type, -> { String }, optional: true, nullable: false
      end
    end
  end
end
