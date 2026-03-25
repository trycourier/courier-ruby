# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Notifications#create
    class NotificationTemplateMutationResponse < Courier::Internal::Type::BaseModel
      # @!attribute notification
      #
      #   @return [Courier::Models::NotificationTemplateMutationResponse::Notification]
      required :notification, -> { Courier::NotificationTemplateMutationResponse::Notification }

      # @!attribute state
      #   The template state after the operation. Always uppercase.
      #
      #   @return [Symbol, Courier::Models::NotificationTemplateMutationResponse::State]
      required :state, enum: -> { Courier::NotificationTemplateMutationResponse::State }

      # @!method initialize(notification:, state:)
      #   Response returned by POST and PUT operations.
      #
      #   @param notification [Courier::Models::NotificationTemplateMutationResponse::Notification]
      #
      #   @param state [Symbol, Courier::Models::NotificationTemplateMutationResponse::State] The template state after the operation. Always uppercase.

      # @see Courier::Models::NotificationTemplateMutationResponse#notification
      class Notification < Courier::Internal::Type::BaseModel
        # @!attribute id
        #   The ID of the created or updated template.
        #
        #   @return [String]
        required :id, String

        # @!method initialize(id:)
        #   @param id [String] The ID of the created or updated template.
      end

      # The template state after the operation. Always uppercase.
      #
      # @see Courier::Models::NotificationTemplateMutationResponse#state
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
