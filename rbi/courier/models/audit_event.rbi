# typed: strong

module Courier
  module Models
    class AuditEvent < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Courier::AuditEvent, Courier::Internal::AnyHash) }

      sig { returns(Courier::AuditEvent::Actor) }
      attr_reader :actor

      sig { params(actor: Courier::AuditEvent::Actor::OrHash).void }
      attr_writer :actor

      sig { returns(String) }
      attr_accessor :audit_event_id

      sig { returns(String) }
      attr_accessor :source

      sig { returns(String) }
      attr_accessor :target

      sig { returns(String) }
      attr_accessor :timestamp

      sig { returns(String) }
      attr_accessor :type

      sig do
        params(
          actor: Courier::AuditEvent::Actor::OrHash,
          audit_event_id: String,
          source: String,
          target: String,
          timestamp: String,
          type: String
        ).returns(T.attached_class)
      end
      def self.new(actor:, audit_event_id:, source:, target:, timestamp:, type:)
      end

      sig do
        override.returns(
          {
            actor: Courier::AuditEvent::Actor,
            audit_event_id: String,
            source: String,
            target: String,
            timestamp: String,
            type: String
          }
        )
      end
      def to_hash
      end

      class Actor < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Courier::AuditEvent::Actor, Courier::Internal::AnyHash)
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(T.nilable(String)) }
        attr_accessor :email

        sig do
          params(id: String, email: T.nilable(String)).returns(T.attached_class)
        end
        def self.new(id:, email: nil)
        end

        sig { override.returns({ id: String, email: T.nilable(String) }) }
        def to_hash
        end
      end
    end
  end
end
