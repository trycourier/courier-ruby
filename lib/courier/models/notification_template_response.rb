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

      # @!attribute alias_
      #   A template's send-time alias as returned by a read, omitted entirely when it has
      #   none. Usually a single string; an array for a template that resolves from
      #   several aliases, which writes through this API can no longer produce — only
      #   templates predating that restriction, or aliases attached outside this API, hold
      #   more than one.
      #
      #   @return [String, Array<String>, nil]
      optional :alias_, union: -> { Courier::NotificationTemplateAlias }, api_name: :alias

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

      # @!method initialize(id:, created:, creator:, state:, alias_: nil, updated: nil, updater: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::NotificationTemplateResponse} for more details.
      #
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
      #   @param alias_ [String, Array<String>] A template's send-time alias as returned by a read, omitted entirely when it has
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
