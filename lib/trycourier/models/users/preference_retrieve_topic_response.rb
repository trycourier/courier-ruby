# frozen_string_literal: true

module Trycourier
  module Models
    module Users
      # @see Trycourier::Resources::Users::Preferences#retrieve_topic
      class PreferenceRetrieveTopicResponse < Trycourier::Internal::Type::BaseModel
        # @!attribute topic
        #
        #   @return [Trycourier::Models::TopicPreference]
        required :topic, -> { Trycourier::TopicPreference }

        # @!method initialize(topic:)
        #   @param topic [Trycourier::Models::TopicPreference]
      end
    end
  end
end
