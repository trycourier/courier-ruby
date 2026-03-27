# frozen_string_literal: true

module Courier
  module Models
    class VersionNode < Courier::Internal::Type::BaseModel
      # @!attribute created
      #   Epoch milliseconds when this version was created.
      #
      #   @return [Integer]
      required :created, Integer

      # @!attribute creator
      #   User ID of the version creator.
      #
      #   @return [String]
      required :creator, String

      # @!attribute version
      #   Version identifier. One of "draft", "published:vNNN" (current published
      #   version), or "vNNN" (historical version).
      #
      #   @return [String]
      required :version, String

      # @!attribute has_changes
      #   Whether the draft has unpublished changes. Only present on the draft version.
      #
      #   @return [Boolean, nil]
      optional :has_changes, Courier::Internal::Type::Boolean

      # @!method initialize(created:, creator:, version:, has_changes: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::VersionNode} for more details.
      #
      #   A version entry for a notification template.
      #
      #   @param created [Integer] Epoch milliseconds when this version was created.
      #
      #   @param creator [String] User ID of the version creator.
      #
      #   @param version [String] Version identifier. One of "draft", "published:vNNN" (current published version)
      #
      #   @param has_changes [Boolean] Whether the draft has unpublished changes. Only present on the draft version.
    end
  end
end
