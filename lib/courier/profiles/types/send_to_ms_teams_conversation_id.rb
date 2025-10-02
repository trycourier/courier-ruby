# frozen_string_literal: true

module Courier
  module Profiles
    module Types
      class SendToMsTeamsConversationId < Internal::Types::Model
        field :conversation_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
