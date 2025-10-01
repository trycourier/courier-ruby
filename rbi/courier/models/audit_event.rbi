# typed: strong

module Courier
  module Models
    class AuditEvent < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Courier::AuditEvent, Courier::Internal::AnyHash) }

      sig { returns(String) }
      attr_accessor :audit_event_id

      sig { returns(String) }
      attr_accessor :source

      sig { returns(String) }
      attr_accessor :timestamp

      sig { returns(String) }
      attr_accessor :type

      sig { returns(T.nilable(Courier::AuditEvent::Actor)) }
      attr_reader :actor

      sig { params(actor: T.nilable(Courier::AuditEvent::Actor::OrHash)).void }
      attr_writer :actor

      sig { returns(T.nilable(Courier::AuditEvent::Target)) }
      attr_reader :target

      sig do
        params(target: T.nilable(Courier::AuditEvent::Target::OrHash)).void
      end
      attr_writer :target

      sig do
        params(
          audit_event_id: String,
          source: String,
          timestamp: String,
          type: String,
          actor: T.nilable(Courier::AuditEvent::Actor::OrHash),
          target: T.nilable(Courier::AuditEvent::Target::OrHash)
        ).returns(T.attached_class)
      end
      def self.new(
        audit_event_id:,
        source:,
        timestamp:,
        type:,
        actor: nil,
        target: nil
      )
      end

      sig do
        override.returns(
          {
            audit_event_id: String,
            source: String,
            timestamp: String,
            type: String,
            actor: T.nilable(Courier::AuditEvent::Actor),
            target: T.nilable(Courier::AuditEvent::Target)
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

        sig { returns(T.nilable(String)) }
        attr_accessor :id

        sig { returns(T.nilable(String)) }
        attr_accessor :email

        sig do
          params(id: T.nilable(String), email: T.nilable(String)).returns(
            T.attached_class
          )
        end
        def self.new(id: nil, email: nil)
        end

        sig do
          override.returns({ id: T.nilable(String), email: T.nilable(String) })
        end
        def to_hash
        end
      end

      class Target < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Courier::AuditEvent::Target, Courier::Internal::AnyHash)
          end

        sig { returns(T.nilable(String)) }
        attr_accessor :id

        sig { returns(T.nilable(String)) }
        attr_accessor :email

        sig do
          params(id: T.nilable(String), email: T.nilable(String)).returns(
            T.attached_class
          )
        end
        def self.new(id: nil, email: nil)
        end

        sig do
          override.returns({ id: T.nilable(String), email: T.nilable(String) })
        end
        def to_hash
        end
      end
    end
  end
end
