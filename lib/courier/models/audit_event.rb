# frozen_string_literal: true

module Courier
  module Models
    class AuditEvent < Courier::Internal::Type::BaseModel
      # @!attribute actor
      #
      #   @return [Courier::Models::AuditEvent::Actor]
      required :actor, -> { Courier::AuditEvent::Actor }

      # @!attribute audit_event_id
      #
      #   @return [String]
      required :audit_event_id, String, api_name: :auditEventId

      # @!attribute source
      #
      #   @return [String]
      required :source, String

      # @!attribute target
      #
      #   @return [String]
      required :target, String

      # @!attribute timestamp
      #
      #   @return [String]
      required :timestamp, String

      # @!attribute type
      #
      #   @return [String]
      required :type, String

      # @!method initialize(actor:, audit_event_id:, source:, target:, timestamp:, type:)
      #   @param actor [Courier::Models::AuditEvent::Actor]
      #   @param audit_event_id [String]
      #   @param source [String]
      #   @param target [String]
      #   @param timestamp [String]
      #   @param type [String]

      # @see Courier::Models::AuditEvent#actor
      class Actor < Courier::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute email
        #
        #   @return [String, nil]
        optional :email, String, nil?: true

        # @!method initialize(id:, email: nil)
        #   @param id [String]
        #   @param email [String, nil]
      end
    end
  end
end
