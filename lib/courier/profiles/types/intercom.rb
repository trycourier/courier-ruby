# frozen_string_literal: true

require_relative "intercom_recipient"
require "json"

module Courier
  class Profiles
    class Intercom
      attr_reader :from, :to, :additional_properties

      # @param from [String]
      # @param to [Profiles::IntercomRecipient]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Profiles::Intercom]
      def initialize(from:, to:, additional_properties: nil)
        # @type [String]
        @from = from
        # @type [Profiles::IntercomRecipient]
        @to = to
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of Intercom
      #
      # @param json_object [JSON]
      # @return [Profiles::Intercom]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        from = struct.from
        if parsed_json["to"].nil?
          to = nil
        else
          to = parsed_json["to"].to_json
          to = Profiles::IntercomRecipient.from_json(json_object: to)
        end
        new(from: from, to: to, additional_properties: struct)
      end

      # Serialize an instance of Intercom to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "from": @from, "to": @to }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.from.is_a?(String) != false || raise("Passed value for field obj.from is not the expected type, validation failed.")
        Profiles::IntercomRecipient.validate_raw(obj: obj.to)
      end
    end
  end
end
