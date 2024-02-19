# frozen_string_literal: true

require_relative "subscription_topic_status"
require "json"

module Courier
  class Tenants
    class SubscriptionTopic
      attr_reader :id, :status, :additional_properties

      # @param id [String] Topic ID
      # @param status [SUBSCRIPTION_TOPIC_STATUS]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Tenants::SubscriptionTopic]
      def initialize(id:, status:, additional_properties: nil)
        # @type [String] Topic ID
        @id = id
        # @type [SUBSCRIPTION_TOPIC_STATUS]
        @status = status
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of SubscriptionTopic
      #
      # @param json_object [JSON]
      # @return [Tenants::SubscriptionTopic]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct.id
        status = Tenants::SUBSCRIPTION_TOPIC_STATUS.key(parsed_json["status"]) || parsed_json["status"]
        new(id: id, status: status, additional_properties: struct)
      end

      # Serialize an instance of SubscriptionTopic to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "id": @id, "status": Tenants::SUBSCRIPTION_TOPIC_STATUS[@status] || @status }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.status.is_a?(Tenants::SUBSCRIPTION_TOPIC_STATUS) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      end
    end
  end
end
