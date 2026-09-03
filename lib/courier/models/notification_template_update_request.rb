# frozen_string_literal: true

module Courier
  module Models
    class NotificationTemplateUpdateRequest < Courier::Internal::Type::BaseModel
      # @!attribute notification
      #   Template fields accepted in POST and PUT request bodies, nested under a
      #   `notification` key.
      #
      #   @return [Courier::Models::NotificationTemplateWritePayload]
      required :notification, -> { Courier::NotificationTemplateWritePayload }

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
      #   Request body for replacing a notification template. All fields are required,
      #   since `PUT` is a full replacement, except `alias`, whose omission leaves the
      #   existing aliases in place. Unlike `NotificationTemplateCreateRequest`,
      #   `notification.content` is not required to place its elements inside a channel
      #   block: the requirement applies to creation only, so templates already stored
      #   without one stay editable.
      #
      #   @param notification [Courier::Models::NotificationTemplateWritePayload] Template fields accepted in POST and PUT request bodies, nested under a `notific
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
