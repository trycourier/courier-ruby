# frozen_string_literal: true

require_relative "../../send/types/message_data"
require_relative "../../send/types/message_channels"
require_relative "../../send/types/message_context"
require_relative "../../send/types/message_metadata"
require_relative "../../send/types/message_preferences"
require_relative "../../send/types/message_providers"
require_relative "../../send/types/routing"
require_relative "../../send/types/timeout"
require_relative "../../send/types/delay"
require_relative "../../send/types/expiry"
require "json"

module Courier
  class Bulk
    class InboundBulkTemplateMessage
      attr_reader :template, :data, :brand_id, :channels, :context, :metadata, :preferences, :providers, :routing,
                  :timeout, :delay, :expiry, :additional_properties

      # @param template [String] The id of the notification template to be rendered and sent to the recipient(s).
      #   This field or the content field must be supplied.
      # @param data [Send::MESSAGE_DATA] An arbitrary object that includes any data you want to pass to the message.
      #   The data will populate the corresponding template or elements variables.
      # @param brand_id [String]
      # @param channels [Send::MESSAGE_CHANNELS] "Define run-time configuration for one or more channels. If you don't specify channels, the default configuration for each channel will be used. Valid ChannelId's are: email, sms, push, inbox, direct_message, banner, and webhook."
      # @param context [Send::MessageContext] Context to load with this recipient. Will override any context set on message.context.
      # @param metadata [Send::MessageMetadata] Metadata such as utm tracking attached with the notification through this channel.
      # @param preferences [Send::MessagePreferences]
      # @param providers [Send::MESSAGE_PROVIDERS] An object whose keys are valid provider identifiers which map to an object.
      # @param routing [Send::Routing]
      # @param timeout [Send::Timeout] Time in ms to attempt the channel before failing over to the next available channel.
      # @param delay [Send::Delay] Defines the time to wait before delivering the message. You can specify one of the following options. Duration with the number of milliseconds to delay. Until with an ISO 8601 timestamp that specifies when it should be delivered. Until with an OpenStreetMap opening_hours-like format that specifies the [Delivery Window](https://www.courier.com/docs/platform/sending/failover/#delivery-window) (e.g., 'Mo-Fr 08:00-18:00pm')
      # @param expiry [Send::Expiry] "Expiry allows you to set an absolute or relative time in which a message expires.
      #   Note: This is only valid for the Courier Inbox channel as of 12-08-2022."
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Bulk::InboundBulkTemplateMessage]
      def initialize(template:, data: nil, brand_id: nil, channels: nil, context: nil, metadata: nil, preferences: nil,
                     providers: nil, routing: nil, timeout: nil, delay: nil, expiry: nil, additional_properties: nil)
        # @type [String] The id of the notification template to be rendered and sent to the recipient(s).
        #   This field or the content field must be supplied.
        @template = template
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
        # @type [Send::MessagePreferences]
        @preferences = preferences
        # @type [Send::MESSAGE_PROVIDERS] An object whose keys are valid provider identifiers which map to an object.
        @providers = providers
        # @type [Send::Routing]
        @routing = routing
        # @type [Send::Timeout] Time in ms to attempt the channel before failing over to the next available channel.
        @timeout = timeout
        # @type [Send::Delay] Defines the time to wait before delivering the message. You can specify one of the following options. Duration with the number of milliseconds to delay. Until with an ISO 8601 timestamp that specifies when it should be delivered. Until with an OpenStreetMap opening_hours-like format that specifies the [Delivery Window](https://www.courier.com/docs/platform/sending/failover/#delivery-window) (e.g., 'Mo-Fr 08:00-18:00pm')
        @delay = delay
        # @type [Send::Expiry] "Expiry allows you to set an absolute or relative time in which a message expires.
        #   Note: This is only valid for the Courier Inbox channel as of 12-08-2022."
        @expiry = expiry
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of InboundBulkTemplateMessage
      #
      # @param json_object [JSON]
      # @return [Bulk::InboundBulkTemplateMessage]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        template = struct.template
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
        if parsed_json["preferences"].nil?
          preferences = nil
        else
          preferences = parsed_json["preferences"].to_json
          preferences = Send::MessagePreferences.from_json(json_object: preferences)
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
        new(template: template, data: data, brand_id: brand_id, channels: channels, context: context,
            metadata: metadata, preferences: preferences, providers: providers, routing: routing, timeout: timeout, delay: delay, expiry: expiry, additional_properties: struct)
      end

      # Serialize an instance of InboundBulkTemplateMessage to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "template": @template,
          "data": @data,
          "brand_id": @brand_id,
          "channels": @channels,
          "context": @context,
          "metadata": @metadata,
          "preferences": @preferences,
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
        obj.template.is_a?(String) != false || raise("Passed value for field obj.template is not the expected type, validation failed.")
        obj.data&.is_a?(Hash) != false || raise("Passed value for field obj.data is not the expected type, validation failed.")
        obj.brand_id&.is_a?(String) != false || raise("Passed value for field obj.brand_id is not the expected type, validation failed.")
        obj.channels&.is_a?(Hash) != false || raise("Passed value for field obj.channels is not the expected type, validation failed.")
        obj.context.nil? || Send::MessageContext.validate_raw(obj: obj.context)
        obj.metadata.nil? || Send::MessageMetadata.validate_raw(obj: obj.metadata)
        obj.preferences.nil? || Send::MessagePreferences.validate_raw(obj: obj.preferences)
        obj.providers&.is_a?(Hash) != false || raise("Passed value for field obj.providers is not the expected type, validation failed.")
        obj.routing.nil? || Send::Routing.validate_raw(obj: obj.routing)
        obj.timeout.nil? || Send::Timeout.validate_raw(obj: obj.timeout)
        obj.delay.nil? || Send::Delay.validate_raw(obj: obj.delay)
        obj.expiry.nil? || Send::Expiry.validate_raw(obj: obj.expiry)
      end
    end
  end
end
