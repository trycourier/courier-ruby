# frozen_string_literal: true

require_relative "../../../commons/types/preference_status"
require_relative "../../../commons/types/channel_classification"
require "json"

module Courier
  module Users
    class Preferences
      class TopicPreferenceUpdate
        attr_reader :status, :custom_routing, :has_custom_routing, :additional_properties

        # @param status [Commons::PreferenceStatus]
        # @param custom_routing [Array<Commons::ChannelClassification>] The Channels a user has chosen to receive notifications through for this topic
        # @param has_custom_routing [Boolean]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Users::Preferences::TopicPreferenceUpdate]
        def initialize(status:, custom_routing: nil, has_custom_routing: nil, additional_properties: nil)
          # @type [Commons::PreferenceStatus]
          @status = status
          # @type [Array<Commons::ChannelClassification>] The Channels a user has chosen to receive notifications through for this topic
          @custom_routing = custom_routing
          # @type [Boolean]
          @has_custom_routing = has_custom_routing
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of TopicPreferenceUpdate
        #
        # @param json_object [JSON]
        # @return [Users::Preferences::TopicPreferenceUpdate]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          JSON.parse(json_object)
          status = struct.status
          custom_routing = struct.custom_routing
          has_custom_routing = struct.has_custom_routing
          new(status: status, custom_routing: custom_routing, has_custom_routing: has_custom_routing,
              additional_properties: struct)
        end

        # Serialize an instance of TopicPreferenceUpdate to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "status": @status, "custom_routing": @custom_routing, "has_custom_routing": @has_custom_routing }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.status.is_a?(Commons::PreferenceStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
          obj.custom_routing&.is_a?(Array) != false || raise("Passed value for field obj.custom_routing is not the expected type, validation failed.")
          obj.has_custom_routing&.is_a?(Boolean) != false || raise("Passed value for field obj.has_custom_routing is not the expected type, validation failed.")
        end
      end
    end
  end
end
