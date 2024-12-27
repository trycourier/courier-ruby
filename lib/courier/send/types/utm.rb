# frozen_string_literal: true

require "json"

module Courier
  class Send
    class Utm
      attr_reader :source, :medium, :campaign, :term, :content, :additional_properties

      # @param source [String]
      # @param medium [String]
      # @param campaign [String]
      # @param term [String]
      # @param content [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::Utm]
      def initialize(source: nil, medium: nil, campaign: nil, term: nil, content: nil, additional_properties: nil)
        # @type [String]
        @source = source
        # @type [String]
        @medium = medium
        # @type [String]
        @campaign = campaign
        # @type [String]
        @term = term
        # @type [String]
        @content = content
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of Utm
      #
      # @param json_object [JSON]
      # @return [Send::Utm]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        source = struct.source
        medium = struct.medium
        campaign = struct.campaign
        term = struct.term
        content = struct.content
        new(source: source, medium: medium, campaign: campaign, term: term, content: content,
            additional_properties: struct)
      end

      # Serialize an instance of Utm to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "source": @source, "medium": @medium, "campaign": @campaign, "term": @term, "content": @content }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.source&.is_a?(String) != false || raise("Passed value for field obj.source is not the expected type, validation failed.")
        obj.medium&.is_a?(String) != false || raise("Passed value for field obj.medium is not the expected type, validation failed.")
        obj.campaign&.is_a?(String) != false || raise("Passed value for field obj.campaign is not the expected type, validation failed.")
        obj.term&.is_a?(String) != false || raise("Passed value for field obj.term is not the expected type, validation failed.")
        obj.content&.is_a?(String) != false || raise("Passed value for field obj.content is not the expected type, validation failed.")
      end
    end
  end
end
