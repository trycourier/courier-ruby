# frozen_string_literal: true

require_relative "content"
require_relative "message_recipient"
require_relative "message_data"
require_relative "message_channels"
require_relative "message_context"
require_relative "message_metadata"
require_relative "message_providers"
require_relative "routing"
require_relative "timeout"
require_relative "delay"
require_relative "expiry"
require "json"

module Courier
  class Send
    # The message property has the following primary top-level properties. They define the destination and content of the message.
    # Additional advanced configuration fields [are defined below](https://www.courier.com/docs/reference/send/message/#other-message-properties).
    class ContentMessage
      attr_reader :content, :to, :data, :brand_id, :channels, :context, :metadata, :providers, :routing, :timeout,
                  :delay, :expiry, :additional_properties

      # @param content [Send::Content] Describes the content of the message in a way that will work for email, push,
      #   chat, or any channel. Either this or template must be specified.
      # @param to [Send::MessageRecipient] The recipient or a list of recipients of the message
      # @param data [Send::MESSAGE_DATA] An arbitrary object that includes any data you want to pass to the message.
      #   The data will populate the corresponding template or elements variables.
      # @param brand_id [String]
      # @param channels [Send::MESSAGE_CHANNELS] "Define run-time configuration for one or more channels. If you don't specify channels, the default configuration for each channel will be used. Valid ChannelId's are: email, sms, push, inbox, direct_message, banner, and webhook."
      # @param context [Send::MessageContext] Context to load with this recipient. Will override any context set on message.context.
      # @param metadata [Send::MessageMetadata] Metadata such as utm tracking attached with the notification through this channel.
      # @param providers [Send::MESSAGE_PROVIDERS] An object whose keys are valid provider identifiers which map to an object.
      # @param routing [Send::Routing]
      # @param timeout [Send::Timeout] Time in ms to attempt the channel before failing over to the next available channel.
      # @param delay [Send::Delay] Defines the time to wait before delivering the message.
      # @param expiry [Send::Expiry] "Expiry allows you to set an absolute or relative time in which a message expires.
      #   Note: This is only valid for the Courier Inbox channel as of 12-08-2022."
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::ContentMessage]
      def initialize(content:, to:, data: nil, brand_id: nil, channels: nil, context: nil, metadata: nil,
                     providers: nil, routing: nil, timeout: nil, delay: nil, expiry: nil, additional_properties: nil)
        # @type [Send::Content] Describes the content of the message in a way that will work for email, push,
        #   chat, or any channel. Either this or template must be specified.
        @content = content
        # @type [Send::MessageRecipient] The recipient or a list of recipients of the message
        @to = to
        # @type [Send::MESSAGE_DATA] An arbitrary object that includes any data you want to pass to the message.
        #   The data will populate the corresponding template or elements variables.
        @data = data
        # @type [String]
        @brand_id = brand_id
        # @type [Send::MESSAGE_CHANNELS] "Define run-time configuration for one or more channels. If you don't specify channels, the default configuration for each channel will be used. Valid ChannelId's are: email, sms, push, inbox, direct_message, banner, and webhook."
        @channels = channels
        # @type [Send::MessageContext] Context to load with this recipient. Will override any context set on message.context.
        @context = context
        # @type [Send::MessageMetadata] Metadata such as utm tracking attached with the notification through this channel.
        @metadata = metadata
        # @type [Send::MESSAGE_PROVIDERS] An object whose keys are valid provider identifiers which map to an object.
        @providers = providers
        # @type [Send::Routing]
        @routing = routing
        # @type [Send::Timeout] Time in ms to attempt the channel before failing over to the next available channel.
        @timeout = timeout
        # @type [Send::Delay] Defines the time to wait before delivering the message.
        @delay = delay
        # @type [Send::Expiry] "Expiry allows you to set an absolute or relative time in which a message expires.
        #   Note: This is only valid for the Courier Inbox channel as of 12-08-2022."
        @expiry = expiry
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of ContentMessage
      #
      # @param json_object [JSON]
      # @return [Send::ContentMessage]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["content"].nil?
          content = nil
        else
          content = parsed_json["content"].to_json
          content = Send::Content.from_json(json_object: content)
        end
        if parsed_json["to"].nil?
          to = nil
        else
          to = parsed_json["to"].to_json
          to = Send::MessageRecipient.from_json(json_object: to)
        end
        data = struct.data
        brand_id = struct.brand_id
        channels = struct.channels
        if parsed_json["context"].nil?
          context = nil
        else
          context = parsed_json["context"].to_json
          context = Send::MessageContext.from_json(json_object: context)
        end
        if parsed_json["metadata"].nil?
          metadata = nil
        else
          metadata = parsed_json["metadata"].to_json
          metadata = Send::MessageMetadata.from_json(json_object: metadata)
        end
        providers = struct.providers
        if parsed_json["routing"].nil?
          routing = nil
        else
          routing = parsed_json["routing"].to_json
          routing = Send::Routing.from_json(json_object: routing)
        end
        if parsed_json["timeout"].nil?
          timeout = nil
        else
          timeout = parsed_json["timeout"].to_json
          timeout = Send::Timeout.from_json(json_object: timeout)
        end
        if parsed_json["delay"].nil?
          delay = nil
        else
          delay = parsed_json["delay"].to_json
          delay = Send::Delay.from_json(json_object: delay)
        end
        if parsed_json["expiry"].nil?
          expiry = nil
        else
          expiry = parsed_json["expiry"].to_json
          expiry = Send::Expiry.from_json(json_object: expiry)
        end
        new(content: content, to: to, data: data, brand_id: brand_id, channels: channels, context: context,
            metadata: metadata, providers: providers, routing: routing, timeout: timeout, delay: delay, expiry: expiry, additional_properties: struct)
      end

      # Serialize an instance of ContentMessage to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "content": @content,
          "to": @to,
          "data": @data,
          "brand_id": @brand_id,
          "channels": @channels,
          "context": @context,
          "metadata": @metadata,
          "providers": @providers,
          "routing": @routing,
          "timeout": @timeout,
          "delay": @delay,
          "expiry": @expiry
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        Send::Content.validate_raw(obj: obj.content)
        Send::MessageRecipient.validate_raw(obj: obj.to)
        obj.data&.is_a?(Hash) != false || raise("Passed value for field obj.data is not the expected type, validation failed.")
        obj.brand_id&.is_a?(String) != false || raise("Passed value for field obj.brand_id is not the expected type, validation failed.")
        obj.channels&.is_a?(Hash) != false || raise("Passed value for field obj.channels is not the expected type, validation failed.")
        obj.context.nil? || Send::MessageContext.validate_raw(obj: obj.context)
        obj.metadata.nil? || Send::MessageMetadata.validate_raw(obj: obj.metadata)
        obj.providers&.is_a?(Hash) != false || raise("Passed value for field obj.providers is not the expected type, validation failed.")
        obj.routing.nil? || Send::Routing.validate_raw(obj: obj.routing)
        obj.timeout.nil? || Send::Timeout.validate_raw(obj: obj.timeout)
        obj.delay.nil? || Send::Delay.validate_raw(obj: obj.delay)
        obj.expiry.nil? || Send::Expiry.validate_raw(obj: obj.expiry)
      end
    end
  end
end
