# frozen_string_literal: true

module Courier
  module Models
    class NotificationLocalePutRequest < Courier::Internal::Type::BaseModel
      # @!attribute elements
      #   Elements with locale-specific content overrides.
      #
      #   @return [Array<Courier::Models::NotificationLocalePutRequest::Element>]
      required :elements,
               -> { Courier::Internal::Type::ArrayOf[Courier::NotificationLocalePutRequest::Element] }

      # @!attribute state
      #   Template state. Defaults to `DRAFT`.
      #
      #   @return [Symbol, Courier::Models::NotificationTemplateState, nil]
      optional :state, enum: -> { Courier::NotificationTemplateState }

      # @!method initialize(elements:, state: nil)
      #   Request body for setting locale-specific content overrides. Each element
      #   override must include the target element ID.
      #
      #   @param elements [Array<Courier::Models::NotificationLocalePutRequest::Element>] Elements with locale-specific content overrides.
      #
      #   @param state [Symbol, Courier::Models::NotificationTemplateState] Template state. Defaults to `DRAFT`.

      class Element < Courier::Internal::Type::BaseModel
        # @!attribute id
        #   Target element ID.
        #
        #   @return [String]
        required :id, String

        # @!method initialize(id:)
        #   @param id [String] Target element ID.
      end
    end
  end
end
