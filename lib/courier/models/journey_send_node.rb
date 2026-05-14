# frozen_string_literal: true

module Courier
  module Models
    class JourneySendNode < Courier::Internal::Type::BaseModel
      # @!attribute message
      #
      #   @return [Courier::Models::JourneySendNode::Message]
      required :message, -> { Courier::JourneySendNode::Message }

      # @!attribute type
      #
      #   @return [Symbol, Courier::Models::JourneySendNode::Type]
      required :type, enum: -> { Courier::JourneySendNode::Type }

      # @!attribute id
      #
      #   @return [String, nil]
      optional :id, String

      # @!attribute conditions
      #   Condition spec for a journey node. Accepts a single condition atom, an AND/OR
      #   group, or an AND/OR nested group. Omit the `conditions` property entirely to
      #   express "no conditions".
      #
      #   @return [Array<String>, Courier::Models::JourneyConditionGroup, Courier::Models::JourneyConditionNestedGroup, nil]
      optional :conditions, union: -> { Courier::JourneyConditionsField }

      # @!method initialize(message:, type:, id: nil, conditions: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::JourneySendNode} for more details.
      #
      #   @param message [Courier::Models::JourneySendNode::Message]
      #
      #   @param type [Symbol, Courier::Models::JourneySendNode::Type]
      #
      #   @param id [String]
      #
      #   @param conditions [Array<String>, Courier::Models::JourneyConditionGroup, Courier::Models::JourneyConditionNestedGroup] Condition spec for a journey node. Accepts a single condition atom, an AND/OR gr

      # @see Courier::Models::JourneySendNode#message
      class Message < Courier::Internal::Type::BaseModel
        # @!attribute template
        #
        #   @return [String]
        required :template, String

        # @!attribute data
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :data, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown]

        # @!attribute delay
        #
        #   @return [Courier::Models::JourneySendNode::Message::Delay, nil]
        optional :delay, -> { Courier::JourneySendNode::Message::Delay }

        # @!attribute to
        #
        #   @return [Courier::Models::JourneySendNode::Message::To, nil]
        optional :to, -> { Courier::JourneySendNode::Message::To }

        # @!method initialize(template:, data: nil, delay: nil, to: nil)
        #   @param template [String]
        #   @param data [Hash{Symbol=>Object}]
        #   @param delay [Courier::Models::JourneySendNode::Message::Delay]
        #   @param to [Courier::Models::JourneySendNode::Message::To]

        # @see Courier::Models::JourneySendNode::Message#delay
        class Delay < Courier::Internal::Type::BaseModel
          # @!attribute until_
          #
          #   @return [String]
          required :until_, String, api_name: :until

          # @!attribute timezone
          #
          #   @return [String, nil]
          optional :timezone, String

          # @!method initialize(until_:, timezone: nil)
          #   @param until_ [String]
          #   @param timezone [String]
        end

        # @see Courier::Models::JourneySendNode::Message#to
        class To < Courier::Internal::Type::BaseModel
          # @!attribute email_override
          #
          #   @return [String, nil]
          optional :email_override, String

          # @!attribute phone_number_override
          #
          #   @return [String, nil]
          optional :phone_number_override, String

          # @!attribute user_id_override
          #
          #   @return [String, nil]
          optional :user_id_override, String

          # @!method initialize(email_override: nil, phone_number_override: nil, user_id_override: nil)
          #   @param email_override [String]
          #   @param phone_number_override [String]
          #   @param user_id_override [String]
        end
      end

      # @see Courier::Models::JourneySendNode#type
      module Type
        extend Courier::Internal::Type::Enum

        SEND = :send

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
