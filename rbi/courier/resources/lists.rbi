# typed: strong

module Courier
  module Resources
    class Lists
      sig { returns(Courier::Resources::Lists::Subscriptions) }
      attr_reader :subscriptions

      # Returns one list by id with its name and created and updated timestamps. Fetch
      # its subscribers separately with the subscriptions endpoint.
      sig do
        params(
          list_id: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::SubscriptionList)
      end
      def retrieve(
        # A unique identifier representing the list you wish to retrieve.
        list_id,
        request_options: {}
      )
      end

      # Creates or replaces a list from a name and preferences. Subscribers are managed
      # through the separate subscriptions endpoints.
      sig do
        params(
          list_id: String,
          name: String,
          preferences: T.nilable(Courier::RecipientPreferences::OrHash),
          request_options: Courier::RequestOptions::OrHash
        ).void
      end
      def update(
        # A unique identifier representing the list you wish to retrieve.
        list_id,
        name:,
        preferences: nil,
        request_options: {}
      )
      end

      # Returns the workspace's lists, filterable by a pattern to fetch a subset such as
      # every regional list. Paged by cursor.
      sig do
        params(
          cursor: T.nilable(String),
          pattern: T.nilable(String),
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::Models::ListListResponse)
      end
      def list(
        # A unique identifier that allows for fetching the next page of lists.
        cursor: nil,
        # "A pattern used to filter the list items returned. Pattern types supported:
        # exact match on `list_id` or a pattern of one or more pattern parts. you may
        # replace a part with either: `*` to match all parts in that position, or `**` to
        # signify a wildcard `endsWith` pattern match."
        pattern: nil,
        request_options: {}
      )
      end

      # Deletes a list, halting sends that target it. A previously deleted list can be
      # brought back with the companion restore endpoint.
      sig do
        params(
          list_id: String,
          request_options: Courier::RequestOptions::OrHash
        ).void
      end
      def delete(
        # A unique identifier representing the list you wish to retrieve.
        list_id,
        request_options: {}
      )
      end

      # Restores a previously deleted list along with its subscribers, so a list removed
      # by mistake can be brought back rather than rebuilt.
      sig do
        params(
          list_id: String,
          request_options: Courier::RequestOptions::OrHash
        ).void
      end
      def restore(
        # A unique identifier representing the list you wish to retrieve.
        list_id,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Courier::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
