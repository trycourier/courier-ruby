# frozen_string_literal: true

module Courier
  module Models
    module Users
      # @see Courier::Resources::Users::Preferences#retrieve_topic
      class PreferenceRetrieveTopicResponse < Courier::Internal::Type::BaseModel
        # @!attribute topic
        #
        #   @return [Courier::Models::Users::TopicPreference]
        required :topic, -> { Courier::Users::TopicPreference }

        # @!method initialize(topic:)
        #   @param topic [Courier::Models::Users::TopicPreference]
      end
    end
  end
end
