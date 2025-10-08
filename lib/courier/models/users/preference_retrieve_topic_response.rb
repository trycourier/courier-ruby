# frozen_string_literal: true

module Courier
  module Models
    module Users
      # @see Courier::Resources::Users::Preferences#retrieve_topic
      class PreferenceRetrieveTopicResponse < Courier::Internal::Type::BaseModel
        # @!attribute topic
        #
        #   @return [Courier::Models::TopicPreference]
        required :topic, -> { Courier::TopicPreference }

        # @!method initialize(topic:)
        #   @param topic [Courier::Models::TopicPreference]
      end
    end
  end
end
