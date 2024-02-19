# frozen_string_literal: true

require_relative "../../../commons/types/channel_classification"
require_relative "../../../commons/types/preference_status"
require "json"

module Courier
  module Users
    class Preferences
      class TopicPreference
        attr_reader :custom_routing, :default_status, :has_custom_routing, :status, :topic_id, :topic_name,
                    :additional_properties

        # @param custom_routing [Array<Commons::CHANNEL_CLASSIFICATION>] The Channels a user has chosen to receive notifications through for this topic
        # @param default_status [PREFERENCE_STATUS]
        # @param has_custom_routing [Boolean]
        # @param status [PREFERENCE_STATUS]
        # @param topic_id [String]
        # @param topic_name [String]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Users::Preferences::TopicPreference]
        def initialize(default_status:, status:, topic_id:, topic_name:, custom_routing: nil, has_custom_routing: nil,
                       additional_properties: nil)
          # @type [Array<Commons::CHANNEL_CLASSIFICATION>] The Channels a user has chosen to receive notifications through for this topic
          @custom_routing = custom_routing
          # @type [PREFERENCE_STATUS]
          @default_status = default_status
          # @type [Boolean]
          @has_custom_routing = has_custom_routing
          # @type [PREFERENCE_STATUS]
          @status = status
          # @type [String]
          @topic_id = topic_id
          # @type [String]
          @topic_name = topic_name
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of TopicPreference
        #
        # @param json_object [JSON]
        # @return [Users::Preferences::TopicPreference]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          custom_routing = parsed_json["custom_routing"]&.map do |v|
            v = v.to_json
            Commons::CHANNEL_CLASSIFICATION.key(v) || v
          end
          default_status = Commons::PREFERENCE_STATUS.key(parsed_json["default_status"]) || parsed_json["default_status"]
          has_custom_routing = struct.has_custom_routing
          status = Commons::PREFERENCE_STATUS.key(parsed_json["status"]) || parsed_json["status"]
          topic_id = struct.topic_id
          topic_name = struct.topic_name
          new(custom_routing: custom_routing, default_status: default_status, has_custom_routing: has_custom_routing,
              status: status, topic_id: topic_id, topic_name: topic_name, additional_properties: struct)
        end

        # Serialize an instance of TopicPreference to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "custom_routing": @custom_routing,
            "default_status": Commons::PREFERENCE_STATUS[@default_status] || @default_status,
            "has_custom_routing": @has_custom_routing,
            "status": Commons::PREFERENCE_STATUS[@status] || @status,
            "topic_id": @topic_id,
            "topic_name": @topic_name
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.custom_routing&.is_a?(Array) != false || raise("Passed value for field obj.custom_routing is not the expected type, validation failed.")
          obj.default_status.is_a?(Commons::PREFERENCE_STATUS) != false || raise("Passed value for field obj.default_status is not the expected type, validation failed.")
          obj.has_custom_routing&.is_a?(Boolean) != false || raise("Passed value for field obj.has_custom_routing is not the expected type, validation failed.")
          obj.status.is_a?(Commons::PREFERENCE_STATUS) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
          obj.topic_id.is_a?(String) != false || raise("Passed value for field obj.topic_id is not the expected type, validation failed.")
          obj.topic_name.is_a?(String) != false || raise("Passed value for field obj.topic_name is not the expected type, validation failed.")
        end
      end
    end
  end
end
