# frozen_string_literal: true

require_relative "rendered_message_content"
require "json"

module Courier
  class Messages
    class RenderOutput
      attr_reader :channel, :channel_id, :content, :additional_properties

      # @param channel [String] The channel used for rendering the message.
      # @param channel_id [String] The ID of channel used for rendering the message.
      # @param content [Messages::RenderedMessageContent] Content details of the rendered message.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Messages::RenderOutput]
      def initialize(channel:, channel_id:, content:, additional_properties: nil)
        # @type [String] The channel used for rendering the message.
        @channel = channel
        # @type [String] The ID of channel used for rendering the message.
        @channel_id = channel_id
        # @type [Messages::RenderedMessageContent] Content details of the rendered message.
        @content = content
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of RenderOutput
      #
      # @param json_object [JSON]
      # @return [Messages::RenderOutput]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        channel = struct.channel
        channel_id = struct.channel_id
        if parsed_json["content"].nil?
          content = nil
        else
          content = parsed_json["content"].to_json
          content = Messages::RenderedMessageContent.from_json(json_object: content)
        end
        new(channel: channel, channel_id: channel_id, content: content, additional_properties: struct)
      end

      # Serialize an instance of RenderOutput to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "channel": @channel, "channel_id": @channel_id, "content": @content }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.channel.is_a?(String) != false || raise("Passed value for field obj.channel is not the expected type, validation failed.")
        obj.channel_id.is_a?(String) != false || raise("Passed value for field obj.channel_id is not the expected type, validation failed.")
        Messages::RenderedMessageContent.validate_raw(obj: obj.content)
      end
    end
  end
end
