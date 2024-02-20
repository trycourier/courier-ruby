# frozen_string_literal: true

require_relative "inbound_bulk_message_user"
require "json"

module Courier
  class Bulk
    class BulkIngestUsersParams
      attr_reader :users, :additional_properties

      # @param users [Array<Bulk::InboundBulkMessageUser>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Bulk::BulkIngestUsersParams]
      def initialize(users:, additional_properties: nil)
        # @type [Array<Bulk::InboundBulkMessageUser>]
        @users = users
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of BulkIngestUsersParams
      #
      # @param json_object [JSON]
      # @return [Bulk::BulkIngestUsersParams]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        users = parsed_json["users"]&.map do |v|
          v = v.to_json
          Bulk::InboundBulkMessageUser.from_json(json_object: v)
        end
        new(users: users, additional_properties: struct)
      end

      # Serialize an instance of BulkIngestUsersParams to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "users": @users }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.users.is_a?(Array) != false || raise("Passed value for field obj.users is not the expected type, validation failed.")
      end
    end
  end
end
