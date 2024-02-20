# frozen_string_literal: true
require "json"
require_relative "recipient"

module Courier
  class Send
    class MessageRecipient
      # Deserialize a JSON object to an instance of MessageRecipient
      #
      # @param json_object [JSON] 
      # @return [Send::MessageRecipient]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        begin
          Send::Recipient.validate_raw(obj: struct)
          return Send::Recipient.from_json(json_object: json_object)
        rescue StandardError
          # noop
        end
        begin
          struct.is_a?(Array) != false || raise("Passed value for field struct is not the expected type, validation failed.")
          return unless json_object.nil?
  json_object.map do | v |
  v = v.to_json
  Send::Recipient.from_json(json_object: v)
end
else
  nil
end
        rescue StandardError
          # noop
        end
 return struct
      end
      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object] 
      # @return [Void]
      def self.validate_raw(obj:)
        begin
          return Send::Recipient.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return obj.is_a?(Array) != false || raise("Passed value for field obj is not the expected type, validation failed.")
        rescue StandardError
          # noop
        end
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
  end
end