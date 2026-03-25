# frozen_string_literal: true

module Courier
  module Models
    class NotificationTemplateSummary < Courier::Internal::Type::BaseModel
      # @!attribute id
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

      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!attribute state
      #
      #   @return [Symbol, Courier::Models::NotificationTemplateSummary::State]
      required :state, enum: -> { Courier::NotificationTemplateSummary::State }

      # @!attribute tags
      #
      #   @return [Array<String>]
      required :tags, Courier::Internal::Type::ArrayOf[String]

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

      # @!method initialize(id:, created:, creator:, name:, state:, tags:, updated: nil, updater: nil)
      #   V2 (CDS) template summary returned in list responses.
      #
      #   @param id [String]
      #
      #   @param created [Integer] Epoch milliseconds when the template was created.
      #
      #   @param creator [String] User ID of the creator.
      #
      #   @param name [String]
      #
      #   @param state [Symbol, Courier::Models::NotificationTemplateSummary::State]
      #
      #   @param tags [Array<String>]
      #
      #   @param updated [Integer] Epoch milliseconds of last update.
      #
      #   @param updater [String] User ID of the last updater.

      # @see Courier::Models::NotificationTemplateSummary#state
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
