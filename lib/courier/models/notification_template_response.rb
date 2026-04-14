# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Notifications#create
    class NotificationTemplateResponse < Courier::Models::NotificationTemplatePayload
      # @!attribute id
      #   The template ID.
      #
      #   @return [String]
      required :id, String

      # @!attribute created
      #   Epoch milliseconds when the template was created.
      #
      #   @return [Integer]
      required :created, Integer

      # @!attribute creator
      #   User ID of the creator.
      #
      #   @return [String]
      required :creator, String

      # @!attribute state
      #   The template state. Always uppercase.
      #
      #   @return [Symbol, Courier::Models::NotificationTemplateResponse::State]
      required :state, enum: -> { Courier::NotificationTemplateResponse::State }

      # @!attribute updated
      #   Epoch milliseconds of last update.
      #
      #   @return [Integer, nil]
      optional :updated, Integer

      # @!attribute updater
      #   User ID of the last updater.
      #
      #   @return [String, nil]
      optional :updater, String

      # @!method initialize(id:, created:, creator:, state:, updated: nil, updater: nil)
      #   Response for GET /notifications/{id}, POST /notifications, and PUT
      #   /notifications/{id}. Returns all template fields at the top level.
      #
      #   @param id [String] The template ID.
      #
      #   @param created [Integer] Epoch milliseconds when the template was created.
      #
      #   @param creator [String] User ID of the creator.
      #
      #   @param state [Symbol, Courier::Models::NotificationTemplateResponse::State] The template state. Always uppercase.
      #
      #   @param updated [Integer] Epoch milliseconds of last update.
      #
      #   @param updater [String] User ID of the last updater.

      # The template state. Always uppercase.
      module State
        extend Courier::Internal::Type::Enum

        DRAFT = :DRAFT
        PUBLISHED = :PUBLISHED

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
