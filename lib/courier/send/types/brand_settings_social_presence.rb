# frozen_string_literal: true

require_relative "base_social_presence"
require "json"

module Courier
  class Send
    class BrandSettingsSocialPresence
      attr_reader :inherit_default, :facebook, :instagram, :linkedin, :medium, :twitter, :additional_properties

      # @param inherit_default [Boolean]
      # @param facebook [Send::BaseSocialPresence]
      # @param instagram [Send::BaseSocialPresence]
      # @param linkedin [Send::BaseSocialPresence]
      # @param medium [Send::BaseSocialPresence]
      # @param twitter [Send::BaseSocialPresence]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::BrandSettingsSocialPresence]
      def initialize(inherit_default: nil, facebook: nil, instagram: nil, linkedin: nil, medium: nil, twitter: nil,
                     additional_properties: nil)
        # @type [Boolean]
        @inherit_default = inherit_default
        # @type [Send::BaseSocialPresence]
        @facebook = facebook
        # @type [Send::BaseSocialPresence]
        @instagram = instagram
        # @type [Send::BaseSocialPresence]
        @linkedin = linkedin
        # @type [Send::BaseSocialPresence]
        @medium = medium
        # @type [Send::BaseSocialPresence]
        @twitter = twitter
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of BrandSettingsSocialPresence
      #
      # @param json_object [JSON]
      # @return [Send::BrandSettingsSocialPresence]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        inherit_default = struct.inheritDefault
        if parsed_json["facebook"].nil?
          facebook = nil
        else
          facebook = parsed_json["facebook"].to_json
          facebook = Send::BaseSocialPresence.from_json(json_object: facebook)
        end
        if parsed_json["instagram"].nil?
          instagram = nil
        else
          instagram = parsed_json["instagram"].to_json
          instagram = Send::BaseSocialPresence.from_json(json_object: instagram)
        end
        if parsed_json["linkedin"].nil?
          linkedin = nil
        else
          linkedin = parsed_json["linkedin"].to_json
          linkedin = Send::BaseSocialPresence.from_json(json_object: linkedin)
        end
        if parsed_json["medium"].nil?
          medium = nil
        else
          medium = parsed_json["medium"].to_json
          medium = Send::BaseSocialPresence.from_json(json_object: medium)
        end
        if parsed_json["twitter"].nil?
          twitter = nil
        else
          twitter = parsed_json["twitter"].to_json
          twitter = Send::BaseSocialPresence.from_json(json_object: twitter)
        end
        new(inherit_default: inherit_default, facebook: facebook, instagram: instagram, linkedin: linkedin,
            medium: medium, twitter: twitter, additional_properties: struct)
      end

      # Serialize an instance of BrandSettingsSocialPresence to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "inheritDefault": @inherit_default,
          "facebook": @facebook,
          "instagram": @instagram,
          "linkedin": @linkedin,
          "medium": @medium,
          "twitter": @twitter
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.inherit_default&.is_a?(Boolean) != false || raise("Passed value for field obj.inherit_default is not the expected type, validation failed.")
        obj.facebook.nil? || Send::BaseSocialPresence.validate_raw(obj: obj.facebook)
        obj.instagram.nil? || Send::BaseSocialPresence.validate_raw(obj: obj.instagram)
        obj.linkedin.nil? || Send::BaseSocialPresence.validate_raw(obj: obj.linkedin)
        obj.medium.nil? || Send::BaseSocialPresence.validate_raw(obj: obj.medium)
        obj.twitter.nil? || Send::BaseSocialPresence.validate_raw(obj: obj.twitter)
      end
    end
  end
end
