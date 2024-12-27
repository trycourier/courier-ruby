# frozen_string_literal: true

require "json"

module Courier
  class Send
    class Delay
      attr_reader :duration, :until_, :additional_properties

      # @param duration [Integer] The duration of the delay in milliseconds.
      # @param until_ [String] An ISO 8601 timestamp that specifies when it should be delivered or an OpenStreetMap opening_hours-like format that specifies the [Delivery Window](https://www.courier.com/docs/platform/sending/failover/#delivery-window) (e.g., 'Mo-Fr 08:00-18:00pm')
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::Delay]
      def initialize(duration: nil, until_: nil, additional_properties: nil)
        # @type [Integer] The duration of the delay in milliseconds.
        @duration = duration
        # @type [String] An ISO 8601 timestamp that specifies when it should be delivered or an OpenStreetMap opening_hours-like format that specifies the [Delivery Window](https://www.courier.com/docs/platform/sending/failover/#delivery-window) (e.g., 'Mo-Fr 08:00-18:00pm')
        @until_ = until_
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of Delay
      #
      # @param json_object [JSON]
      # @return [Send::Delay]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        duration = struct.duration
        until_ = struct.until
        new(duration: duration, until_: until_, additional_properties: struct)
      end

      # Serialize an instance of Delay to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "duration": @duration, "until": @until_ }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.duration&.is_a?(Integer) != false || raise("Passed value for field obj.duration is not the expected type, validation failed.")
        obj.until_&.is_a?(String) != false || raise("Passed value for field obj.until_ is not the expected type, validation failed.")
      end
    end
  end
end
