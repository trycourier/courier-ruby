# frozen_string_literal: true

module Courier
  module Profiles
    module Types
      class SendToMsTeamsChannelId < Internal::Types::Model
        field :channel_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
