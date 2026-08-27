# typed: strong

module Courier
  module Models
    class JourneySendNode < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::JourneySendNode, Courier::Internal::AnyHash)
        end

      sig { returns(Courier::JourneySendNode::Message) }
      attr_reader :message

      sig { params(message: Courier::JourneySendNode::Message::OrHash).void }
      attr_writer :message

      sig { returns(Courier::JourneySendNode::Type::OrSymbol) }
      attr_accessor :type

      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      # Condition spec for a journey node. Accepts a single condition atom, an AND/OR
      # group, or an AND/OR nested group. Omit the `conditions` property entirely to
      # express "no conditions".
      sig do
        returns(
          T.nilable(
            T.any(
              T::Array[String],
              Courier::JourneyConditionGroup,
              Courier::JourneyConditionNestedGroup
            )
          )
        )
      end
      attr_reader :conditions

      sig do
        params(
          conditions:
            T.any(
              T::Array[String],
              Courier::JourneyConditionGroup::OrHash,
              Courier::JourneyConditionNestedGroup::OrHash
            )
        ).void
      end
      attr_writer :conditions

      # A/B experiment config for a send node. The recipient is deterministically
      # bucketed by `bucketingKey` and routed to one of the `variants` in proportion to
      # its `weight`. Present on a send node INSTEAD OF `message.template`.
      sig { returns(T.nilable(Courier::JourneyExperiment)) }
      attr_reader :experiment

      sig { params(experiment: Courier::JourneyExperiment::OrHash).void }
      attr_writer :experiment

      # Send to the recipient. A send node sources its content from EXACTLY ONE of
      # `message.template` (a single notification template) or `experiment` (an A/B
      # split across weighted template variants) — supplying both, or neither, is
      # rejected. Optionally override the recipient address, send as a tenant, delay the
      # send, or attach `data`.
      sig do
        params(
          message: Courier::JourneySendNode::Message::OrHash,
          type: Courier::JourneySendNode::Type::OrSymbol,
          id: String,
          conditions:
            T.any(
              T::Array[String],
              Courier::JourneyConditionGroup::OrHash,
              Courier::JourneyConditionNestedGroup::OrHash
            ),
          experiment: Courier::JourneyExperiment::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        message:,
        type:,
        id: nil,
        # Condition spec for a journey node. Accepts a single condition atom, an AND/OR
        # group, or an AND/OR nested group. Omit the `conditions` property entirely to
        # express "no conditions".
        conditions: nil,
        # A/B experiment config for a send node. The recipient is deterministically
        # bucketed by `bucketingKey` and routed to one of the `variants` in proportion to
        # its `weight`. Present on a send node INSTEAD OF `message.template`.
        experiment: nil
      )
      end

      sig do
        override.returns(
          {
            message: Courier::JourneySendNode::Message,
            type: Courier::JourneySendNode::Type::OrSymbol,
            id: String,
            conditions:
              T.any(
                T::Array[String],
                Courier::JourneyConditionGroup,
                Courier::JourneyConditionNestedGroup
              ),
            experiment: Courier::JourneyExperiment
          }
        )
      end
      def to_hash
      end

      class Message < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Courier::JourneySendNode::Message, Courier::Internal::AnyHash)
          end

        # Tenant context for this send. Set it to deliver on behalf of one of your
        # customers, so the message uses that tenant's brand and settings.
        sig { returns(T.nilable(Courier::JourneySendNode::Message::Context)) }
        attr_reader :context

        sig do
          params(
            context: Courier::JourneySendNode::Message::Context::OrHash
          ).void
        end
        attr_writer :context

        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_reader :data

        sig { params(data: T::Hash[Symbol, T.anything]).void }
        attr_writer :data

        sig { returns(T.nilable(Courier::JourneySendNode::Message::Delay)) }
        attr_reader :delay

        sig do
          params(delay: Courier::JourneySendNode::Message::Delay::OrHash).void
        end
        attr_writer :delay

        sig { returns(T.nilable(String)) }
        attr_reader :template

        sig { params(template: String).void }
        attr_writer :template

        # Recipient override for this send. Provide exactly one of `email_override`,
        # `phone_number_override`, `user_id_override`, `slack`, or `ms_teams` — not a
        # combination.
        sig { returns(T.nilable(Courier::JourneySendNode::Message::To)) }
        attr_reader :to

        sig { params(to: Courier::JourneySendNode::Message::To::OrHash).void }
        attr_writer :to

        sig do
          params(
            context: Courier::JourneySendNode::Message::Context::OrHash,
            data: T::Hash[Symbol, T.anything],
            delay: Courier::JourneySendNode::Message::Delay::OrHash,
            template: String,
            to: Courier::JourneySendNode::Message::To::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Tenant context for this send. Set it to deliver on behalf of one of your
          # customers, so the message uses that tenant's brand and settings.
          context: nil,
          data: nil,
          delay: nil,
          template: nil,
          # Recipient override for this send. Provide exactly one of `email_override`,
          # `phone_number_override`, `user_id_override`, `slack`, or `ms_teams` — not a
          # combination.
          to: nil
        )
        end

        sig do
          override.returns(
            {
              context: Courier::JourneySendNode::Message::Context,
              data: T::Hash[Symbol, T.anything],
              delay: Courier::JourneySendNode::Message::Delay,
              template: String,
              to: Courier::JourneySendNode::Message::To
            }
          )
        end
        def to_hash
        end

        class Context < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::JourneySendNode::Message::Context,
                Courier::Internal::AnyHash
              )
            end

          # The tenant to send as. Accepts either a literal tenant id (`acme-tenant`) or a
          # whole-string mustache reference to a value the run already holds —
          # `{{data.tenant_id}}` from the invocation payload, or `{{f1.body.tenant_id}}`
          # from the response of an earlier fetch node with id `f1`. A reference is resolved
          # separately on every run, so a single journey can deliver as many tenants. Two
          # forms are rejected with `400`: mid-string interpolation such as
          # `tenant-{{data.region}}`, and any value beginning with `refs.`, which is
          # reserved for internal use. A reference that resolves to nothing at run time does
          # not stop the run — the message is still sent, with no tenant context — so make
          # sure the referenced value is always present. `GET` returns the value in the same
          # form it was supplied.
          sig { returns(String) }
          attr_accessor :tenant_id

          # Tenant context for this send. Set it to deliver on behalf of one of your
          # customers, so the message uses that tenant's brand and settings.
          sig { params(tenant_id: String).returns(T.attached_class) }
          def self.new(
            # The tenant to send as. Accepts either a literal tenant id (`acme-tenant`) or a
            # whole-string mustache reference to a value the run already holds —
            # `{{data.tenant_id}}` from the invocation payload, or `{{f1.body.tenant_id}}`
            # from the response of an earlier fetch node with id `f1`. A reference is resolved
            # separately on every run, so a single journey can deliver as many tenants. Two
            # forms are rejected with `400`: mid-string interpolation such as
            # `tenant-{{data.region}}`, and any value beginning with `refs.`, which is
            # reserved for internal use. A reference that resolves to nothing at run time does
            # not stop the run — the message is still sent, with no tenant context — so make
            # sure the referenced value is always present. `GET` returns the value in the same
            # form it was supplied.
            tenant_id:
          )
          end

          sig { override.returns({ tenant_id: String }) }
          def to_hash
          end
        end

        class Delay < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::JourneySendNode::Message::Delay,
                Courier::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :until_

          sig { returns(T.nilable(String)) }
          attr_reader :timezone

          sig { params(timezone: String).void }
          attr_writer :timezone

          sig do
            params(until_: String, timezone: String).returns(T.attached_class)
          end
          def self.new(until_:, timezone: nil)
          end

          sig { override.returns({ until_: String, timezone: String }) }
          def to_hash
          end
        end

        class To < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::JourneySendNode::Message::To,
                Courier::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_reader :email_override

          sig { params(email_override: String).void }
          attr_writer :email_override

          # Send to a Microsoft Teams address directly, bypassing the recipient's stored
          # profile. Requires exactly one target: `channel_id`, `channel_name` (with
          # `team_id`), `user_id`, or `email`. `channel_name`, `user_id`, and `email` also
          # need at least one of `service_url` or `tenant_id` — if you provide both, they
          # must agree. `channel_id` doesn't require tenant context to publish, but provide
          # `service_url` or `tenant_id` anyway: sends without either have failed at
          # delivery in testing. `conversation_id` and `reply_to_activity_id`, available on
          # the send API's `MsTeams` profile, aren't supported here yet.
          sig { returns(T.nilable(Courier::JourneySendNodeToMsTeams)) }
          attr_reader :ms_teams

          sig do
            params(ms_teams: Courier::JourneySendNodeToMsTeams::OrHash).void
          end
          attr_writer :ms_teams

          sig { returns(T.nilable(String)) }
          attr_reader :phone_number_override

          sig { params(phone_number_override: String).void }
          attr_writer :phone_number_override

          # Send to a Slack address directly, bypassing the recipient's stored profile.
          # Requires exactly one of `channel`, `user_id`, or `email`.
          sig do
            returns(
              T.nilable(
                T.any(
                  Courier::JourneySendNodeToSlackChannel,
                  Courier::JourneySendNodeToSlackUserID,
                  Courier::JourneySendNodeToSlackEmail
                )
              )
            )
          end
          attr_reader :slack

          sig do
            params(
              slack:
                T.any(
                  Courier::JourneySendNodeToSlackChannel::OrHash,
                  Courier::JourneySendNodeToSlackUserID::OrHash,
                  Courier::JourneySendNodeToSlackEmail::OrHash
                )
            ).void
          end
          attr_writer :slack

          sig { returns(T.nilable(String)) }
          attr_reader :user_id_override

          sig { params(user_id_override: String).void }
          attr_writer :user_id_override

          # Recipient override for this send. Provide exactly one of `email_override`,
          # `phone_number_override`, `user_id_override`, `slack`, or `ms_teams` — not a
          # combination.
          sig do
            params(
              email_override: String,
              ms_teams: Courier::JourneySendNodeToMsTeams::OrHash,
              phone_number_override: String,
              slack:
                T.any(
                  Courier::JourneySendNodeToSlackChannel::OrHash,
                  Courier::JourneySendNodeToSlackUserID::OrHash,
                  Courier::JourneySendNodeToSlackEmail::OrHash
                ),
              user_id_override: String
            ).returns(T.attached_class)
          end
          def self.new(
            email_override: nil,
            # Send to a Microsoft Teams address directly, bypassing the recipient's stored
            # profile. Requires exactly one target: `channel_id`, `channel_name` (with
            # `team_id`), `user_id`, or `email`. `channel_name`, `user_id`, and `email` also
            # need at least one of `service_url` or `tenant_id` — if you provide both, they
            # must agree. `channel_id` doesn't require tenant context to publish, but provide
            # `service_url` or `tenant_id` anyway: sends without either have failed at
            # delivery in testing. `conversation_id` and `reply_to_activity_id`, available on
            # the send API's `MsTeams` profile, aren't supported here yet.
            ms_teams: nil,
            phone_number_override: nil,
            # Send to a Slack address directly, bypassing the recipient's stored profile.
            # Requires exactly one of `channel`, `user_id`, or `email`.
            slack: nil,
            user_id_override: nil
          )
          end

          sig do
            override.returns(
              {
                email_override: String,
                ms_teams: Courier::JourneySendNodeToMsTeams,
                phone_number_override: String,
                slack:
                  T.any(
                    Courier::JourneySendNodeToSlackChannel,
                    Courier::JourneySendNodeToSlackUserID,
                    Courier::JourneySendNodeToSlackEmail
                  ),
                user_id_override: String
              }
            )
          end
          def to_hash
          end
        end
      end

      module Type
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Courier::JourneySendNode::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        SEND = T.let(:send, Courier::JourneySendNode::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Courier::JourneySendNode::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
