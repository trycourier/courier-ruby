# frozen_string_literal: true

module Courier
  module Models
    class NotificationTemplateCreateRequest < Courier::Internal::Type::BaseModel
      # @!attribute notification
      #   Core template fields used in POST and PUT request bodies (nested under a
      #   `notification` key) and returned at the top level in responses.
      #
      #   @return [Courier::Models::NotificationTemplatePayload]
      required :notification, -> { Courier::NotificationTemplatePayload }

      # @!attribute state
      #   Template state after creation. Case-insensitive input, normalized to uppercase
      #   in the response. Defaults to "DRAFT".
      #
      #   @return [Symbol, Courier::Models::NotificationTemplateCreateRequest::State, nil]
      optional :state, enum: -> { Courier::NotificationTemplateCreateRequest::State }

      # @!method initialize(notification:, state: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::NotificationTemplateCreateRequest} for more details.
      #
      #   Request body for creating a notification template.
      #
      #   @param notification [Courier::Models::NotificationTemplatePayload] Core template fields used in POST and PUT request bodies (nested under a `notifi
      #
      #   @param state [Symbol, Courier::Models::NotificationTemplateCreateRequest::State] Template state after creation. Case-insensitive input, normalized to uppercase i

      # Template state after creation. Case-insensitive input, normalized to uppercase
      # in the response. Defaults to "DRAFT".
      #
      # @see Courier::Models::NotificationTemplateCreateRequest#state
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
