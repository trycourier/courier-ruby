# frozen_string_literal: true

require_relative "topic_preference"
require "json"

module Courier
  module Users
    class Preferences
      class UserPreferencesGetResponse
        attr_reader :topic, :additional_properties

        # @param topic [Users::Preferences::TopicPreference]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Users::Preferences::UserPreferencesGetResponse]
        def initialize(topic:, additional_properties: nil)
          # @type [Users::Preferences::TopicPreference]
          @topic = topic
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of UserPreferencesGetResponse
        #
        # @param json_object [JSON]
        # @return [Users::Preferences::UserPreferencesGetResponse]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          if parsed_json["topic"].nil?
            topic = nil
          else
            topic = parsed_json["topic"].to_json
            topic = Users::Preferences::TopicPreference.from_json(json_object: topic)
          end
          new(topic: topic, additional_properties: struct)
        end

        # Serialize an instance of UserPreferencesGetResponse to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "topic": @topic }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          Users::Preferences::TopicPreference.validate_raw(obj: obj.topic)
        end
      end
    end
  end
end
