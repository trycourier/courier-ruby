# frozen_string_literal: true

require "json"
require_relative "elemental_text_node"
require_relative "elemental_meta_node"
require_relative "elemental_channel_node"
require_relative "elemental_image_node"
require_relative "elemental_action_node"
require_relative "elemental_divider_node"
require_relative "elemental_group_node"
require_relative "elemental_quote_node"

module Courier
  class Send
    class ElementalNode
      attr_reader :member, :discriminant

      private_class_method :new
      alias kind_of? is_a?
      # @param member [Object]
      # @param discriminant [String]
      # @return [Send::ElementalNode]
      def initialize(member:, discriminant:)
        # @type [Object]
        @member = member
        # @type [String]
        @discriminant = discriminant
      end

      # Deserialize a JSON object to an instance of ElementalNode
      #
      # @param json_object [JSON]
      # @return [Send::ElementalNode]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        member = case struct.type
                 when "text"
                   Send::ElementalTextNode.from_json(json_object: json_object)
                 when "meta"
                   Send::ElementalMetaNode.from_json(json_object: json_object)
                 when "channel"
                   Send::ElementalChannelNode.from_json(json_object: json_object)
                 when "image"
                   Send::ElementalImageNode.from_json(json_object: json_object)
                 when "action"
                   Send::ElementalActionNode.from_json(json_object: json_object)
                 when "divider"
                   Send::ElementalDividerNode.from_json(json_object: json_object)
                 when "group"
                   Send::ElementalGroupNode.from_json(json_object: json_object)
                 when "quote"
                   Send::ElementalQuoteNode.from_json(json_object: json_object)
                 else
                   Send::ElementalTextNode.from_json(json_object: json_object)
                 end
        new(member: member, discriminant: struct.type)
      end

      # For Union Types, to_json functionality is delegated to the wrapped member.
      #
      # @return [JSON]
      def to_json(*_args)
        case @discriminant
        when "text"
          { **@member.to_json, type: @discriminant }.to_json
        when "meta"
          { **@member.to_json, type: @discriminant }.to_json
        when "channel"
          { **@member.to_json, type: @discriminant }.to_json
        when "image"
          { **@member.to_json, type: @discriminant }.to_json
        when "action"
          { **@member.to_json, type: @discriminant }.to_json
        when "divider"
          { **@member.to_json, type: @discriminant }.to_json
        when "group"
          { **@member.to_json, type: @discriminant }.to_json
        when "quote"
          { **@member.to_json, type: @discriminant }.to_json
        else
          { "type": @discriminant, value: @member }.to_json
        end
        @member.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        case obj.type
        when "text"
          Send::ElementalTextNode.validate_raw(obj: obj)
        when "meta"
          Send::ElementalMetaNode.validate_raw(obj: obj)
        when "channel"
          Send::ElementalChannelNode.validate_raw(obj: obj)
        when "image"
          Send::ElementalImageNode.validate_raw(obj: obj)
        when "action"
          Send::ElementalActionNode.validate_raw(obj: obj)
        when "divider"
          Send::ElementalDividerNode.validate_raw(obj: obj)
        when "group"
          Send::ElementalGroupNode.validate_raw(obj: obj)
        when "quote"
          Send::ElementalQuoteNode.validate_raw(obj: obj)
        else
          raise("Passed value matched no type within the union, validation failed.")
        end
      end

      # For Union Types, is_a? functionality is delegated to the wrapped member.
      #
      # @param obj [Object]
      # @return [Boolean]
      def is_a?(obj)
        @member.is_a?(obj)
      end

      # @param member [Send::ElementalTextNode]
      # @return [Send::ElementalNode]
      def self.text(member:)
        new(member: member, discriminant: "text")
      end

      # @param member [Send::ElementalMetaNode]
      # @return [Send::ElementalNode]
      def self.meta(member:)
        new(member: member, discriminant: "meta")
      end

      # @param member [Send::ElementalChannelNode]
      # @return [Send::ElementalNode]
      def self.channel(member:)
        new(member: member, discriminant: "channel")
      end

      # @param member [Send::ElementalImageNode]
      # @return [Send::ElementalNode]
      def self.image(member:)
        new(member: member, discriminant: "image")
      end

      # @param member [Send::ElementalActionNode]
      # @return [Send::ElementalNode]
      def self.action(member:)
        new(member: member, discriminant: "action")
      end

      # @param member [Send::ElementalDividerNode]
      # @return [Send::ElementalNode]
      def self.divider(member:)
        new(member: member, discriminant: "divider")
      end

      # @param member [Send::ElementalGroupNode]
      # @return [Send::ElementalNode]
      def self.group(member:)
        new(member: member, discriminant: "group")
      end

      # @param member [Send::ElementalQuoteNode]
      # @return [Send::ElementalNode]
      def self.quote(member:)
        new(member: member, discriminant: "quote")
      end
    end
  end
end
