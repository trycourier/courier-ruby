# typed: strong

module Courier
  module Resources
    class Lists
      sig { returns(Courier::Resources::Lists::Subscriptions) }
      attr_reader :subscriptions

      # Returns a list based on the list ID provided.
      sig do
        params(
          list_id: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::List)
      end
      def retrieve(
        # A unique identifier representing the list you wish to retrieve.
        list_id,
        request_options: {}
      )
      end

      # Create or replace an existing list with the supplied values.
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

      # Returns all of the lists, with the ability to filter based on a pattern.
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

      # Delete a list by list ID.
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

      # Restore a previously deleted list.
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
