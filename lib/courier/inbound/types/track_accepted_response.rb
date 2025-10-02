# frozen_string_literal: true

module Courier
  module Inbound
    module Types
      class TrackAcceptedResponse < Internal::Types::Model
        field :message_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
