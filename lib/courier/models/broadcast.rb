# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Broadcasts#create
    class Broadcast < Courier::Internal::Type::BaseModel
      # @!attribute id
      #   The broadcast ID (bst\_ prefix).
      #
      #   @return [String]
      required :id, String

      # @!attribute channel
      #   The broadcast's delivery channel.
      #
      #   @return [Symbol, Courier::Models::Broadcast::Channel]
      required :channel, enum: -> { Courier::Broadcast::Channel }

      # @!attribute created_at
      #   ISO 8601 timestamp when the broadcast was created.
      #
      #   @return [String]
      required :created_at, String

      # @!attribute created_by
      #   Actor that created the broadcast.
      #
      #   @return [String]
      required :created_by, String

      # @!attribute name
      #   Human-readable name.
      #
      #   @return [String]
      required :name, String

      # @!attribute status
      #   Lifecycle status of the broadcast.
      #
      #   @return [Symbol, Courier::Models::Broadcast::Status]
      required :status, enum: -> { Courier::Broadcast::Status }

      # @!attribute updated_at
      #   ISO 8601 timestamp of the last update.
      #
      #   @return [String]
      required :updated_at, String

      # @!attribute updated_by
      #   Actor that last updated the broadcast.
      #
      #   @return [String]
      required :updated_by, String

      # @!attribute archived_at
      #   ISO 8601 timestamp when the broadcast was archived, if archived.
      #
      #   @return [String, nil]
      optional :archived_at, String, nil?: true

      # @!attribute archived_by
      #   Actor that archived the broadcast, if archived.
      #
      #   @return [String, nil]
      optional :archived_by, String, nil?: true

      # @!attribute schedule
      #   The delivery schedule and recipient targeting for a broadcast.
      #
      #   @return [Courier::Models::BroadcastSchedule, nil]
      optional :schedule, -> { Courier::BroadcastSchedule }, nil?: true

      # @!method initialize(id:, channel:, created_at:, created_by:, name:, status:, updated_at:, updated_by:, archived_at: nil, archived_by: nil, schedule: nil)
      #   A broadcast — a single-channel message delivered to a known set of recipients (a
      #   list or audience).
      #
      #   @param id [String] The broadcast ID (bst\_ prefix).
      #
      #   @param channel [Symbol, Courier::Models::Broadcast::Channel] The broadcast's delivery channel.
      #
      #   @param created_at [String] ISO 8601 timestamp when the broadcast was created.
      #
      #   @param created_by [String] Actor that created the broadcast.
      #
      #   @param name [String] Human-readable name.
      #
      #   @param status [Symbol, Courier::Models::Broadcast::Status] Lifecycle status of the broadcast.
      #
      #   @param updated_at [String] ISO 8601 timestamp of the last update.
      #
      #   @param updated_by [String] Actor that last updated the broadcast.
      #
      #   @param archived_at [String, nil] ISO 8601 timestamp when the broadcast was archived, if archived.
      #
      #   @param archived_by [String, nil] Actor that archived the broadcast, if archived.
      #
      #   @param schedule [Courier::Models::BroadcastSchedule, nil] The delivery schedule and recipient targeting for a broadcast.

      # The broadcast's delivery channel.
      #
      # @see Courier::Models::Broadcast#channel
      module Channel
        extend Courier::Internal::Type::Enum

        EMAIL = :email
        SMS = :sms
        PUSH = :push
        INBOX = :inbox
        SLACK = :slack
        MSTEAMS = :msteams

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Lifecycle status of the broadcast.
      #
      # @see Courier::Models::Broadcast#status
      module Status
        extend Courier::Internal::Type::Enum

        DRAFT = :draft
        SCHEDULED = :scheduled
        SENDING = :sending
        SENT = :sent

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
