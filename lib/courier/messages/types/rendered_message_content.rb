# frozen_string_literal: true

require_relative "rendered_message_block"
require "json"

module Courier
  class Messages
    class RenderedMessageContent
      attr_reader :html, :title, :body, :subject, :text, :blocks, :additional_properties

      # @param html [String] The html content of the rendered message.
      # @param title [String] The title of the rendered message.
      # @param body [String] The body of the rendered message.
      # @param subject [String] The subject of the rendered message.
      # @param text [String] The text of the rendered message.
      # @param blocks [Array<Messages::RenderedMessageBlock>] The blocks of the rendered message.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Messages::RenderedMessageContent]
      def initialize(html:, title:, body:, subject:, text:, blocks:, additional_properties: nil)
        # @type [String] The html content of the rendered message.
        @html = html
        # @type [String] The title of the rendered message.
        @title = title
        # @type [String] The body of the rendered message.
        @body = body
        # @type [String] The subject of the rendered message.
        @subject = subject
        # @type [String] The text of the rendered message.
        @text = text
        # @type [Array<Messages::RenderedMessageBlock>] The blocks of the rendered message.
        @blocks = blocks
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of RenderedMessageContent
      #
      # @param json_object [JSON]
      # @return [Messages::RenderedMessageContent]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        html = struct.html
        title = struct.title
        body = struct.body
        subject = struct.subject
        text = struct.text
        blocks = parsed_json["blocks"]&.map do |v|
          v = v.to_json
          Messages::RenderedMessageBlock.from_json(json_object: v)
        end
        new(html: html, title: title, body: body, subject: subject, text: text, blocks: blocks,
            additional_properties: struct)
      end

      # Serialize an instance of RenderedMessageContent to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "html": @html, "title": @title, "body": @body, "subject": @subject, "text": @text, "blocks": @blocks }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.html.is_a?(String) != false || raise("Passed value for field obj.html is not the expected type, validation failed.")
        obj.title.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
        obj.body.is_a?(String) != false || raise("Passed value for field obj.body is not the expected type, validation failed.")
        obj.subject.is_a?(String) != false || raise("Passed value for field obj.subject is not the expected type, validation failed.")
        obj.text.is_a?(String) != false || raise("Passed value for field obj.text is not the expected type, validation failed.")
        obj.blocks.is_a?(Array) != false || raise("Passed value for field obj.blocks is not the expected type, validation failed.")
      end
    end
  end
end
