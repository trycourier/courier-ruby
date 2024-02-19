# frozen_string_literal: true

require "json"
require_relative "automation_cancel_step"
require_relative "automation_delay_step"
require_relative "automation_invoke_step"
require_relative "automation_send_step"
require_relative "automation_v_2_send_step"
require_relative "automation_send_list_step"
require_relative "automation_update_profile_step"

module Courier
  class Automations
    class AutomationStepOption
      attr_reader :member
      alias kind_of? is_a?
      # @param member [Object]
      # @return [Automations::AutomationStepOption]
      def initialize(member:)
        # @type [Object]
        @member = member
      end

      # Deserialize a JSON object to an instance of AutomationStepOption
      #
      # @param json_object [JSON]
      # @return [Automations::AutomationStepOption]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        begin
          Automations::AutomationCancelStep.validate_raw(obj: struct)
          member = Automations::AutomationCancelStep.from_json(json_object: json_object)
          return new(member: member)
        rescue StandardError
          # noop
        end
        begin
          Automations::AutomationDelayStep.validate_raw(obj: struct)
          member = Automations::AutomationDelayStep.from_json(json_object: json_object)
          return new(member: member)
        rescue StandardError
          # noop
        end
        begin
          Automations::AutomationInvokeStep.validate_raw(obj: struct)
          member = Automations::AutomationInvokeStep.from_json(json_object: json_object)
          return new(member: member)
        rescue StandardError
          # noop
        end
        begin
          Automations::AutomationSendStep.validate_raw(obj: struct)
          member = Automations::AutomationSendStep.from_json(json_object: json_object)
          return new(member: member)
        rescue StandardError
          # noop
        end
        begin
          Automations::AutomationV2SendStep.validate_raw(obj: struct)
          member = Automations::AutomationV2SendStep.from_json(json_object: json_object)
          return new(member: member)
        rescue StandardError
          # noop
        end
        begin
          Automations::AutomationSendListStep.validate_raw(obj: struct)
          member = Automations::AutomationSendListStep.from_json(json_object: json_object)
          return new(member: member)
        rescue StandardError
          # noop
        end
        begin
          Automations::AutomationUpdateProfileStep.validate_raw(obj: struct)
          member = Automations::AutomationUpdateProfileStep.from_json(json_object: json_object)
          return new(member: member)
        rescue StandardError
          # noop
        end
        new(member: struct)
      end

      # For Union Types, to_json functionality is delegated to the wrapped member.
      #
      # @return [JSON]
      def to_json(*_args)
        @member.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        begin
          return Automations::AutomationCancelStep.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Automations::AutomationDelayStep.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Automations::AutomationInvokeStep.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Automations::AutomationSendStep.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Automations::AutomationV2SendStep.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Automations::AutomationSendListStep.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Automations::AutomationUpdateProfileStep.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        raise("Passed value matched no type within the union, validation failed.")
      end

      # For Union Types, is_a? functionality is delegated to the wrapped member.
      #
      # @param obj [Object]
      # @return [Boolean]
      def is_a?(obj)
        @member.is_a?(obj)
      end
    end
  end
end
