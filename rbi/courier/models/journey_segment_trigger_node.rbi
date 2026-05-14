# typed: strong

module Courier
  module Models
    class JourneySegmentTriggerNode < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::JourneySegmentTriggerNode, Courier::Internal::AnyHash)
        end

      sig { returns(Courier::JourneySegmentTriggerNode::RequestType::OrSymbol) }
      attr_accessor :request_type

      sig { returns(Courier::JourneySegmentTriggerNode::TriggerType::OrSymbol) }
      attr_accessor :trigger_type

      sig { returns(Courier::JourneySegmentTriggerNode::Type::OrSymbol) }
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

      sig { returns(T.nilable(String)) }
      attr_reader :event_id

      sig { params(event_id: String).void }
      attr_writer :event_id

      sig do
        params(
          request_type:
            Courier::JourneySegmentTriggerNode::RequestType::OrSymbol,
          trigger_type:
            Courier::JourneySegmentTriggerNode::TriggerType::OrSymbol,
          type: Courier::JourneySegmentTriggerNode::Type::OrSymbol,
          id: String,
          conditions:
            T.any(
              T::Array[String],
              Courier::JourneyConditionGroup::OrHash,
              Courier::JourneyConditionNestedGroup::OrHash
            ),
          event_id: String
        ).returns(T.attached_class)
      end
      def self.new(
        request_type:,
        trigger_type:,
        type:,
        id: nil,
        # Condition spec for a journey node. Accepts a single condition atom, an AND/OR
        # group, or an AND/OR nested group. Omit the `conditions` property entirely to
        # express "no conditions".
        conditions: nil,
        event_id: nil
      )
      end

      sig do
        override.returns(
          {
            request_type:
              Courier::JourneySegmentTriggerNode::RequestType::OrSymbol,
            trigger_type:
              Courier::JourneySegmentTriggerNode::TriggerType::OrSymbol,
            type: Courier::JourneySegmentTriggerNode::Type::OrSymbol,
            id: String,
            conditions:
              T.any(
                T::Array[String],
                Courier::JourneyConditionGroup,
                Courier::JourneyConditionNestedGroup
              ),
            event_id: String
          }
        )
      end
      def to_hash
      end

      module RequestType
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Courier::JourneySegmentTriggerNode::RequestType)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        IDENTIFY =
          T.let(
            :identify,
            Courier::JourneySegmentTriggerNode::RequestType::TaggedSymbol
          )
        GROUP =
          T.let(
            :group,
            Courier::JourneySegmentTriggerNode::RequestType::TaggedSymbol
          )
        TRACK =
          T.let(
            :track,
            Courier::JourneySegmentTriggerNode::RequestType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Courier::JourneySegmentTriggerNode::RequestType::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      module TriggerType
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Courier::JourneySegmentTriggerNode::TriggerType)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        SEGMENT =
          T.let(
            :segment,
            Courier::JourneySegmentTriggerNode::TriggerType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Courier::JourneySegmentTriggerNode::TriggerType::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      module Type
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Courier::JourneySegmentTriggerNode::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TRIGGER =
          T.let(
            :trigger,
            Courier::JourneySegmentTriggerNode::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Courier::JourneySegmentTriggerNode::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
