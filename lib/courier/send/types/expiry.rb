# frozen_string_literal: true

require_relative "expires_in_type"
require "json"

module Courier
  class Send
    class Expiry
      attr_reader :expires_at, :expires_in, :additional_properties

      # @param expires_at [String] An epoch timestamp or ISO8601 timestamp with timezone `(YYYY-MM-DDThh:mm:ss.sTZD)` that describes the time in which a message expires.
      # @param expires_in [Send::ExpiresInType] A duration in the form of milliseconds or an ISO8601 Duration format (i.e. P1DT4H).
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::Expiry]
      def initialize(expires_in:, expires_at: nil, additional_properties: nil)
        # @type [String] An epoch timestamp or ISO8601 timestamp with timezone `(YYYY-MM-DDThh:mm:ss.sTZD)` that describes the time in which a message expires.
        @expires_at = expires_at
        # @type [Send::ExpiresInType] A duration in the form of milliseconds or an ISO8601 Duration format (i.e. P1DT4H).
        @expires_in = expires_in
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of Expiry
      #
      # @param json_object [JSON]
      # @return [Send::Expiry]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        expires_at = struct.expires_at
        if parsed_json["expires_in"].nil?
          expires_in = nil
        else
          expires_in = parsed_json["expires_in"].to_json
          expires_in = Send::ExpiresInType.from_json(json_object: expires_in)
        end
        new(expires_at: expires_at, expires_in: expires_in, additional_properties: struct)
      end

      # Serialize an instance of Expiry to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "expires_at": @expires_at, "expires_in": @expires_in }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.expires_at&.is_a?(String) != false || raise("Passed value for field obj.expires_at is not the expected type, validation failed.")
        Send::ExpiresInType.validate_raw(obj: obj.expires_in)
      end
    end
  end
end
