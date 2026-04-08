# frozen_string_literal: true

module Courier
  module Models
    class NotificationContentGetResponse < Courier::Internal::Type::BaseModel
      # @!attribute elements
      #
      #   @return [Array<Courier::Models::ElementWithChecksums>]
      required :elements, -> { Courier::Internal::Type::ArrayOf[Courier::ElementWithChecksums] }

      # @!attribute version
      #   Content version identifier.
      #
      #   @return [String]
      required :version, String

      # @!method initialize(elements:, version:)
      #   Elemental content response for V2 templates. Contains versioned elements with
      #   content checksums.
      #
      #   @param elements [Array<Courier::Models::ElementWithChecksums>]
      #
      #   @param version [String] Content version identifier.
    end
  end
end
