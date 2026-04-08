# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Notifications#put_content
    class NotificationContentMutationResponse < Courier::Internal::Type::BaseModel
      # @!attribute id
      #   Template ID.
      #
      #   @return [String]
      required :id, String

      # @!attribute elements
      #
      #   @return [Array<Courier::Models::NotificationContentMutationResponse::Element>]
      required :elements,
               -> { Courier::Internal::Type::ArrayOf[Courier::NotificationContentMutationResponse::Element] }

      # @!attribute state
      #   Template state. Defaults to `DRAFT`.
      #
      #   @return [Symbol, Courier::Models::NotificationTemplateState]
      required :state, enum: -> { Courier::NotificationTemplateState }

      # @!attribute version
      #   Content version identifier.
      #
      #   @return [String]
      required :version, String

      # @!method initialize(id:, elements:, state:, version:)
      #   Shared mutation response for `PUT` content, `PUT` element, and `PUT` locale
      #   operations. Contains the template ID, content version, per-element checksums,
      #   and resulting state.
      #
      #   @param id [String] Template ID.
      #
      #   @param elements [Array<Courier::Models::NotificationContentMutationResponse::Element>]
      #
      #   @param state [Symbol, Courier::Models::NotificationTemplateState] Template state. Defaults to `DRAFT`.
      #
      #   @param version [String] Content version identifier.

      class Element < Courier::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute checksum
        #
        #   @return [String]
        required :checksum, String

        # @!method initialize(id:, checksum:)
        #   @param id [String]
        #   @param checksum [String]
      end
    end
  end
end
