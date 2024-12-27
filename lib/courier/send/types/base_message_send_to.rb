# frozen_string_literal: true

require_relative "message_recipient"
require "json"

module Courier
  class Send
    class BaseMessageSendTo
      attr_reader :to, :additional_properties

      # @param to [Send::MessageRecipient] The recipient or a list of recipients of the message
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::BaseMessageSendTo]
      def initialize(to: nil, additional_properties: nil)
        # @type [Send::MessageRecipient] The recipient or a list of recipients of the message
        @to = to
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of BaseMessageSendTo
      #
      # @param json_object [JSON]
      # @return [Send::BaseMessageSendTo]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["to"].nil?
          to = nil
        else
          to = parsed_json["to"].to_json
          to = Send::MessageRecipient.from_json(json_object: to)
        end
        new(to: to, additional_properties: struct)
      end

      # Serialize an instance of BaseMessageSendTo to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "to": @to }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.to.nil? || Send::MessageRecipient.validate_raw(obj: obj.to)
      end
    end
  end
end
