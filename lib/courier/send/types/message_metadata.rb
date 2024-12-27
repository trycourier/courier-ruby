# frozen_string_literal: true

require_relative "utm"
require "json"

module Courier
  class Send
    class MessageMetadata
      attr_reader :event, :tags, :utm, :trace_id, :additional_properties

      # @param event [String] An arbitrary string to tracks the event that generated this request (e.g. 'signup').
      # @param tags [Array<String>] An array of up to 9 tags you wish to associate with this request (and corresponding messages) for later analysis. Individual tags cannot be more than 30 characters in length.
      # @param utm [Send::Utm] Identify the campaign that refers traffic to a specific website, and attributes the browser's website session.
      # @param trace_id [String] A unique ID used to correlate this request to processing on your servers. Note: Courier does not verify the uniqueness of this ID.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::MessageMetadata]
      def initialize(event: nil, tags: nil, utm: nil, trace_id: nil, additional_properties: nil)
        # @type [String] An arbitrary string to tracks the event that generated this request (e.g. 'signup').
        @event = event
        # @type [Array<String>] An array of up to 9 tags you wish to associate with this request (and corresponding messages) for later analysis. Individual tags cannot be more than 30 characters in length.
        @tags = tags
        # @type [Send::Utm] Identify the campaign that refers traffic to a specific website, and attributes the browser's website session.
        @utm = utm
        # @type [String] A unique ID used to correlate this request to processing on your servers. Note: Courier does not verify the uniqueness of this ID.
        @trace_id = trace_id
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of MessageMetadata
      #
      # @param json_object [JSON]
      # @return [Send::MessageMetadata]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        event = struct.event
        tags = struct.tags
        if parsed_json["utm"].nil?
          utm = nil
        else
          utm = parsed_json["utm"].to_json
          utm = Send::Utm.from_json(json_object: utm)
        end
        trace_id = struct.trace_id
        new(event: event, tags: tags, utm: utm, trace_id: trace_id, additional_properties: struct)
      end

      # Serialize an instance of MessageMetadata to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "event": @event, "tags": @tags, "utm": @utm, "trace_id": @trace_id }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.event&.is_a?(String) != false || raise("Passed value for field obj.event is not the expected type, validation failed.")
        obj.tags&.is_a?(Array) != false || raise("Passed value for field obj.tags is not the expected type, validation failed.")
        obj.utm.nil? || Send::Utm.validate_raw(obj: obj.utm)
        obj.trace_id&.is_a?(String) != false || raise("Passed value for field obj.trace_id is not the expected type, validation failed.")
      end
    end
  end
end
