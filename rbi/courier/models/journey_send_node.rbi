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
      # rejected. Optionally override the recipient address, delay the send, or attach
      # `data`.
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

        sig { returns(T.nilable(Courier::JourneySendNode::Message::To)) }
        attr_reader :to

        sig { params(to: Courier::JourneySendNode::Message::To::OrHash).void }
        attr_writer :to

        sig do
          params(
            data: T::Hash[Symbol, T.anything],
            delay: Courier::JourneySendNode::Message::Delay::OrHash,
            template: String,
            to: Courier::JourneySendNode::Message::To::OrHash
          ).returns(T.attached_class)
        end
        def self.new(data: nil, delay: nil, template: nil, to: nil)
        end

        sig do
          override.returns(
            {
              data: T::Hash[Symbol, T.anything],
              delay: Courier::JourneySendNode::Message::Delay,
              template: String,
              to: Courier::JourneySendNode::Message::To
            }
          )
        end
        def to_hash
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

          sig { returns(T.nilable(String)) }
          attr_reader :phone_number_override

          sig { params(phone_number_override: String).void }
          attr_writer :phone_number_override

          sig { returns(T.nilable(String)) }
          attr_reader :user_id_override

          sig { params(user_id_override: String).void }
          attr_writer :user_id_override

          sig do
            params(
              email_override: String,
              phone_number_override: String,
              user_id_override: String
            ).returns(T.attached_class)
          end
          def self.new(
            email_override: nil,
            phone_number_override: nil,
            user_id_override: nil
          )
          end

          sig do
            override.returns(
              {
                email_override: String,
                phone_number_override: String,
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
