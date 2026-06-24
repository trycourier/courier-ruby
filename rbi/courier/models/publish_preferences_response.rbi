# typed: strong

module Courier
  module Models
    class PublishPreferencesResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::PublishPreferencesResponse, Courier::Internal::AnyHash)
        end

      # Id of the published page snapshot.
      sig { returns(String) }
      attr_accessor :page_id

      # ISO-8601 timestamp of the publish.
      sig { returns(String) }
      attr_accessor :published_at

      # Monotonic published version (epoch milliseconds).
      sig { returns(Float) }
      attr_accessor :published_version

      # Draft-mode hosted preferences page URL for previewing.
      sig { returns(T.nilable(String)) }
      attr_accessor :preview_url

      # Id of the publisher.
      sig { returns(T.nilable(String)) }
      attr_accessor :published_by

      # Result of publishing the workspace's preferences page.
      sig do
        params(
          page_id: String,
          published_at: String,
          published_version: Float,
          preview_url: T.nilable(String),
          published_by: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # Id of the published page snapshot.
        page_id:,
        # ISO-8601 timestamp of the publish.
        published_at:,
        # Monotonic published version (epoch milliseconds).
        published_version:,
        # Draft-mode hosted preferences page URL for previewing.
        preview_url: nil,
        # Id of the publisher.
        published_by: nil
      )
      end

      sig do
        override.returns(
          {
            page_id: String,
            published_at: String,
            published_version: Float,
            preview_url: T.nilable(String),
            published_by: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
