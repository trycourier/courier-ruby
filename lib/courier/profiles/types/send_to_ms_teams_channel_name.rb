# frozen_string_literal: true

module Courier
  module Profiles
    module Types
      class SendToMsTeamsChannelName < Internal::Types::Model
        field :channel_name, -> { String }, optional: false, nullable: false
        field :team_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
