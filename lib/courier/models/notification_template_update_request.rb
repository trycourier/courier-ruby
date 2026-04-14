# frozen_string_literal: true

module Courier
  module Models
    class NotificationTemplateUpdateRequest < Courier::Internal::Type::BaseModel
      # @!attribute notification
      #   Core template fields used in POST and PUT request bodies (nested under a
      #   `notification` key) and returned at the top level in responses.
      #
      #   @return [Courier::Models::NotificationTemplatePayload]
      required :notification, -> { Courier::NotificationTemplatePayload }

      # @!attribute state
      #   Template state after update. Case-insensitive input, normalized to uppercase in
      #   the response. Defaults to "DRAFT".
      #
      #   @return [Symbol, Courier::Models::NotificationTemplateUpdateRequest::State, nil]
      optional :state, enum: -> { Courier::NotificationTemplateUpdateRequest::State }

      # @!method initialize(notification:, state: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::NotificationTemplateUpdateRequest} for more details.
      #
      #   Request body for replacing a notification template. Same shape as create. All
      #   fields required (PUT = full replacement).
      #
      #   @param notification [Courier::Models::NotificationTemplatePayload] Core template fields used in POST and PUT request bodies (nested under a `notifi
      #
      #   @param state [Symbol, Courier::Models::NotificationTemplateUpdateRequest::State] Template state after update. Case-insensitive input, normalized to uppercase in

      # Template state after update. Case-insensitive input, normalized to uppercase in
      # the response. Defaults to "DRAFT".
      #
      # @see Courier::Models::NotificationTemplateUpdateRequest#state
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
