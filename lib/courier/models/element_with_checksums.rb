# frozen_string_literal: true

module Courier
  module Models
    class ElementWithChecksums < Courier::Internal::Type::BaseModel
      # @!attribute checksum
      #   MD5 hash of translatable content.
      #
      #   @return [String]
      required :checksum, String

      # @!attribute type
      #   Element type (text, meta, action, etc.).
      #
      #   @return [String]
      required :type, String

      # @!attribute id
      #
      #   @return [String, nil]
      optional :id, String

      # @!attribute elements
      #   Nested child elements (for group-type elements).
      #
      #   @return [Array<Courier::Models::ElementWithChecksums>, nil]
      optional :elements, -> { Courier::Internal::Type::ArrayOf[Courier::ElementWithChecksums] }

      # @!attribute locales
      #   Locale-specific content with checksums.
      #
      #   @return [Hash{Symbol=>Courier::Models::ElementWithChecksums::Locale}, nil]
      optional :locales, -> { Courier::Internal::Type::HashOf[Courier::ElementWithChecksums::Locale] }

      # @!method initialize(checksum:, type:, id: nil, elements: nil, locales: nil)
      #   An element with its content checksum and optional nested elements and locale
      #   checksums.
      #
      #   @param checksum [String] MD5 hash of translatable content.
      #
      #   @param type [String] Element type (text, meta, action, etc.).
      #
      #   @param id [String]
      #
      #   @param elements [Array<Courier::Models::ElementWithChecksums>] Nested child elements (for group-type elements).
      #
      #   @param locales [Hash{Symbol=>Courier::Models::ElementWithChecksums::Locale}] Locale-specific content with checksums.

      class Locale < Courier::Internal::Type::BaseModel
        # @!attribute checksum
        #
        #   @return [String]
        required :checksum, String

        # @!method initialize(checksum:)
        #   @param checksum [String]
      end
    end
  end
end
