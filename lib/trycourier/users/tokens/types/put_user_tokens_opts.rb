# frozen_string_literal: true

require_relative "user_token"
require "json"

module Courier
  module Users
    class Tokens
      class PutUserTokensOpts
        attr_reader :user_id, :tokens, :additional_properties

        # @param user_id [String]
        # @param tokens [Array<Users::Tokens::UserToken>]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Users::Tokens::PutUserTokensOpts]
        def initialize(user_id:, tokens:, additional_properties: nil)
          # @type [String]
          @user_id = user_id
          # @type [Array<Users::Tokens::UserToken>]
          @tokens = tokens
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of PutUserTokensOpts
        #
        # @param json_object [JSON]
        # @return [Users::Tokens::PutUserTokensOpts]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          user_id = struct.user_id
          tokens = parsed_json["tokens"]&.map do |v|
            v = v.to_json
            Users::Tokens::UserToken.from_json(json_object: v)
          end
          new(user_id: user_id, tokens: tokens, additional_properties: struct)
        end

        # Serialize an instance of PutUserTokensOpts to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "user_id": @user_id, "tokens": @tokens }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.user_id.is_a?(String) != false || raise("Passed value for field obj.user_id is not the expected type, validation failed.")
          obj.tokens.is_a?(Array) != false || raise("Passed value for field obj.tokens is not the expected type, validation failed.")
        end
      end
    end
  end
end
