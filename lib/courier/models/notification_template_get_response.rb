# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Notifications#create
    class NotificationTemplateGetResponse < Courier::Internal::Type::BaseModel
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
      #   @return [Courier::Models::NotificationTemplateGetResponse::Notification]
      required :notification, -> { Courier::NotificationTemplateGetResponse::Notification }

      # @!attribute state
      #   The template state. Always uppercase.
      #
      #   @return [Symbol, Courier::Models::NotificationTemplateGetResponse::State]
      required :state, enum: -> { Courier::NotificationTemplateGetResponse::State }

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
      #   {Courier::Models::NotificationTemplateGetResponse} for more details.
      #
      #   Envelope response for GET /notifications/{id}. The notification object mirrors
      #   the POST/PUT input shape. Nullable fields return null when unset.
      #
      #   @param created [Integer] Epoch milliseconds when the template was created.
      #
      #   @param creator [String] User ID of the creator.
      #
      #   @param notification [Courier::Models::NotificationTemplateGetResponse::Notification] Full document shape used in POST and PUT request bodies, and returned inside the
      #
      #   @param state [Symbol, Courier::Models::NotificationTemplateGetResponse::State] The template state. Always uppercase.
      #
      #   @param updated [Integer] Epoch milliseconds of last update.
      #
      #   @param updater [String] User ID of the last updater.

      # @see Courier::Models::NotificationTemplateGetResponse#notification
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
      # @see Courier::Models::NotificationTemplateGetResponse#state
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
