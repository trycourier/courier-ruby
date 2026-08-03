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

      # @!attribute experiment
      #   A/B experiment config for a send node. The recipient is deterministically
      #   bucketed by `bucketingKey` and routed to one of the `variants` in proportion to
      #   its `weight`. Present on a send node INSTEAD OF `message.template`.
      #
      #   @return [Courier::Models::JourneyExperiment, nil]
      optional :experiment, -> { Courier::JourneyExperiment }

      # @!method initialize(message:, type:, id: nil, conditions: nil, experiment: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::JourneySendNode} for more details.
      #
      #   Send to the recipient. A send node sources its content from EXACTLY ONE of
      #   `message.template` (a single notification template) or `experiment` (an A/B
      #   split across weighted template variants) — supplying both, or neither, is
      #   rejected. Optionally override the recipient address, send as a tenant, delay the
      #   send, or attach `data`.
      #
      #   @param message [Courier::Models::JourneySendNode::Message]
      #
      #   @param type [Symbol, Courier::Models::JourneySendNode::Type]
      #
      #   @param id [String]
      #
      #   @param conditions [Array<String>, Courier::Models::JourneyConditionGroup, Courier::Models::JourneyConditionNestedGroup] Condition spec for a journey node. Accepts a single condition atom, an AND/OR gr
      #
      #   @param experiment [Courier::Models::JourneyExperiment] A/B experiment config for a send node. The recipient is deterministically bucket

      # @see Courier::Models::JourneySendNode#message
      class Message < Courier::Internal::Type::BaseModel
        # @!attribute context
        #   Tenant context for this send. Set it to deliver on behalf of one of your
        #   customers, so the message uses that tenant's brand and settings.
        #
        #   @return [Courier::Models::JourneySendNode::Message::Context, nil]
        optional :context, -> { Courier::JourneySendNode::Message::Context }

        # @!attribute data
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :data, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown]

        # @!attribute delay
        #
        #   @return [Courier::Models::JourneySendNode::Message::Delay, nil]
        optional :delay, -> { Courier::JourneySendNode::Message::Delay }

        # @!attribute template
        #
        #   @return [String, nil]
        optional :template, String

        # @!attribute to
        #
        #   @return [Courier::Models::JourneySendNode::Message::To, nil]
        optional :to, -> { Courier::JourneySendNode::Message::To }

        # @!method initialize(context: nil, data: nil, delay: nil, template: nil, to: nil)
        #   Some parameter documentations has been truncated, see
        #   {Courier::Models::JourneySendNode::Message} for more details.
        #
        #   @param context [Courier::Models::JourneySendNode::Message::Context] Tenant context for this send. Set it to deliver on behalf of one of your custome
        #
        #   @param data [Hash{Symbol=>Object}]
        #
        #   @param delay [Courier::Models::JourneySendNode::Message::Delay]
        #
        #   @param template [String]
        #
        #   @param to [Courier::Models::JourneySendNode::Message::To]

        # @see Courier::Models::JourneySendNode::Message#context
        class Context < Courier::Internal::Type::BaseModel
          # @!attribute tenant_id
          #   The tenant to send as. Accepts either a literal tenant id (`acme-tenant`) or a
          #   whole-string mustache reference to a value the run already holds —
          #   `{{data.tenant_id}}` from the invocation payload, or `{{f1.body.tenant_id}}`
          #   from the response of an earlier fetch node with id `f1`. A reference is resolved
          #   separately on every run, so a single journey can deliver as many tenants. Two
          #   forms are rejected with `400`: mid-string interpolation such as
          #   `tenant-{{data.region}}`, and any value beginning with `refs.`, which is
          #   reserved for internal use. A reference that resolves to nothing at run time does
          #   not stop the run — the message is still sent, with no tenant context — so make
          #   sure the referenced value is always present. `GET` returns the value in the same
          #   form it was supplied.
          #
          #   @return [String]
          required :tenant_id, String

          # @!method initialize(tenant_id:)
          #   Some parameter documentations has been truncated, see
          #   {Courier::Models::JourneySendNode::Message::Context} for more details.
          #
          #   Tenant context for this send. Set it to deliver on behalf of one of your
          #   customers, so the message uses that tenant's brand and settings.
          #
          #   @param tenant_id [String] The tenant to send as. Accepts either a literal tenant id (`acme-tenant`) or a w
        end

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
