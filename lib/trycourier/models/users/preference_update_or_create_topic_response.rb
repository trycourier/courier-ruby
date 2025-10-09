# frozen_string_literal: true

module Trycourier
  module Models
    module Users
      # @see Trycourier::Resources::Users::Preferences#update_or_create_topic
      class PreferenceUpdateOrCreateTopicResponse < Trycourier::Internal::Type::BaseModel
        # @!attribute message
        #
        #   @return [String]
        required :message, String

        # @!method initialize(message:)
        #   @param message [String]
      end
    end
  end
end
