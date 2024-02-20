# frozen_string_literal: true

require_relative "patch_operation"
require "json"

module Courier
  module Users
    class Tokens
      class PatchUserTokenOpts
        attr_reader :patch, :additional_properties

        # @param patch [Array<Users::Tokens::PatchOperation>]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Users::Tokens::PatchUserTokenOpts]
        def initialize(patch:, additional_properties: nil)
          # @type [Array<Users::Tokens::PatchOperation>]
          @patch = patch
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of PatchUserTokenOpts
        #
        # @param json_object [JSON]
        # @return [Users::Tokens::PatchUserTokenOpts]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          patch = parsed_json["patch"]&.map do |v|
            v = v.to_json
            Users::Tokens::PatchOperation.from_json(json_object: v)
          end
          new(patch: patch, additional_properties: struct)
        end

        # Serialize an instance of PatchUserTokenOpts to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "patch": @patch }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.patch.is_a?(Array) != false || raise("Passed value for field obj.patch is not the expected type, validation failed.")
        end
      end
    end
  end
end
