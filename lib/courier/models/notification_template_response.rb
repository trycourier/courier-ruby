# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Notifications#create
    class NotificationTemplateResponse < Courier::Internal::Type::BaseModel
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

      # @!attribute notification
      #   Full document shape used in POST and PUT request bodies, and returned inside the
      #   GET response envelope.
      #
      #   @return [Courier::Models::NotificationTemplateResponse::Notification]
      required :notification, -> { Courier::NotificationTemplateResponse::Notification }

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

      # @!method initialize(created:, creator:, notification:, state:, updated: nil, updater: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::NotificationTemplateResponse} for more details.
      #
      #   Response for GET /notifications/{id}, POST /notifications, and PUT
      #   /notifications/{id}. Wraps the template payload inside a `notification` key
      #   alongside metadata.
      #
      #   @param created [Integer] Epoch milliseconds when the template was created.
      #
      #   @param creator [String] User ID of the creator.
      #
      #   @param notification [Courier::Models::NotificationTemplateResponse::Notification] Full document shape used in POST and PUT request bodies, and returned inside the
      #
      #   @param state [Symbol, Courier::Models::NotificationTemplateResponse::State] The template state. Always uppercase.
      #
      #   @param updated [Integer] Epoch milliseconds of last update.
      #
      #   @param updater [String] User ID of the last updater.

      # @see Courier::Models::NotificationTemplateResponse#notification
      class Notification < Courier::Models::NotificationTemplatePayload
        # @!attribute id
        #   The template ID.
        #
        #   @return [String]
        required :id, String

        # @!method initialize(id:)
        #   Full document shape used in POST and PUT request bodies, and returned inside the
        #   GET response envelope.
        #
        #   @param id [String] The template ID.
      end

      # The template state. Always uppercase.
      #
      # @see Courier::Models::NotificationTemplateResponse#state
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
