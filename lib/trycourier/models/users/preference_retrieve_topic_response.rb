# frozen_string_literal: true

module Trycourier
  module Models
    module Users
      # @see Trycourier::Resources::Users::Preferences#retrieve_topic
      class PreferenceRetrieveTopicResponse < Trycourier::Internal::Type::BaseModel
        # @!attribute topic
        #
        #   @return [Trycourier::Models::Users::TopicPreference]
        required :topic, -> { Trycourier::Users::TopicPreference }

        # @!method initialize(topic:)
        #   @param topic [Trycourier::Models::Users::TopicPreference]
      end
    end
  end
end
