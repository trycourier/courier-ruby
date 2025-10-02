# frozen_string_literal: true

module Courier
  module Send
    module Types
      class MsTeamsRecipient < Internal::Types::Model
        field :ms_teams, -> { Courier::Profiles::Types::MsTeams }, optional: false, nullable: false
      end
    end
  end
end
