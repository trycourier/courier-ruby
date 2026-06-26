# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::WorkspacePreferences#publish
    class PublishPreferencesResponse < Courier::Internal::Type::BaseModel
      # @!attribute page_id
      #   Id of the published page snapshot.
      #
      #   @return [String]
      required :page_id, String

      # @!attribute published_at
      #   ISO-8601 timestamp of the publish.
      #
      #   @return [String]
      required :published_at, String

      # @!attribute published_version
      #   Monotonic published version (epoch milliseconds).
      #
      #   @return [Float]
      required :published_version, Float

      # @!attribute preview_url
      #   Draft-mode hosted preferences page URL for previewing.
      #
      #   @return [String, nil]
      optional :preview_url, String, nil?: true

      # @!attribute published_by
      #   Id of the publisher.
      #
      #   @return [String, nil]
      optional :published_by, String, nil?: true

      # @!method initialize(page_id:, published_at:, published_version:, preview_url: nil, published_by: nil)
      #   Result of publishing the workspace's preferences page.
      #
      #   @param page_id [String] Id of the published page snapshot.
      #
      #   @param published_at [String] ISO-8601 timestamp of the publish.
      #
      #   @param published_version [Float] Monotonic published version (epoch milliseconds).
      #
      #   @param preview_url [String, nil] Draft-mode hosted preferences page URL for previewing.
      #
      #   @param published_by [String, nil] Id of the publisher.
    end
  end
end
