# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::AuditEvents#retrieve
    class AuditEvent < Courier::Internal::Type::BaseModel
      # @!attribute audit_event_id
      #
      #   @return [String]
      required :audit_event_id, String, api_name: :auditEventId

      # @!attribute source
      #
      #   @return [String]
      required :source, String

      # @!attribute timestamp
      #
      #   @return [String]
      required :timestamp, String

      # @!attribute type
      #
      #   @return [String]
      required :type, String

      # @!attribute actor
      #
      #   @return [Courier::Models::AuditEvent::Actor, nil]
      optional :actor, -> { Courier::AuditEvent::Actor }, nil?: true

      # @!attribute target
      #
      #   @return [Courier::Models::AuditEvent::Target, nil]
      optional :target, -> { Courier::AuditEvent::Target }, nil?: true

      # @!method initialize(audit_event_id:, source:, timestamp:, type:, actor: nil, target: nil)
      #   @param audit_event_id [String]
      #   @param source [String]
      #   @param timestamp [String]
      #   @param type [String]
      #   @param actor [Courier::Models::AuditEvent::Actor, nil]
      #   @param target [Courier::Models::AuditEvent::Target, nil]

      # @see Courier::Models::AuditEvent#actor
      class Actor < Courier::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String, nil]
        optional :id, String, nil?: true

        # @!attribute email
        #
        #   @return [String, nil]
        optional :email, String, nil?: true

        # @!method initialize(id: nil, email: nil)
        #   @param id [String, nil]
        #   @param email [String, nil]
      end

      # @see Courier::Models::AuditEvent#target
      class Target < Courier::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String, nil]
        optional :id, String, nil?: true

        # @!attribute email
        #
        #   @return [String, nil]
        optional :email, String, nil?: true

        # @!method initialize(id: nil, email: nil)
        #   @param id [String, nil]
        #   @param email [String, nil]
      end
    end
  end
end
