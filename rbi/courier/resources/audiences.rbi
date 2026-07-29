# typed: strong

module Courier
  module Resources
    # Define filter-based groups whose membership Courier recalculates as user
    # profiles change.
    class Audiences
      # Returns one audience with its name, description, and the filter and AND or OR
      # operator that decide which users belong to it.
      sig do
        params(
          audience_id: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::Audience)
      end
      def retrieve(
        # A unique identifier representing the audience_id
        audience_id,
        request_options: {}
      )
      end

      # Creates or replaces an audience from a filter and an AND or OR operator.
      # Membership recalculates automatically as profiles change.
      sig do
        params(
          audience_id: String,
          description: T.nilable(String),
          filter: T.nilable(Courier::AudienceFilterConfig::OrHash),
          name: T.nilable(String),
          operator:
            T.nilable(Courier::AudienceUpdateParams::Operator::OrSymbol),
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::Models::AudienceUpdateResponse)
      end
      def update(
        # A unique identifier representing the audience id
        audience_id,
        # A description of the audience
        description: nil,
        # Filter configuration for audience membership containing an array of filter rules
        filter: nil,
        # The name of the audience
        name: nil,
        # The logical operator (AND/OR) combining the top-level `filter.filters`.
        # Convenience alias for `filter.operator`: if set, it is applied to the top-level
        # filter group. Prefer setting `operator` directly inside `filter`.
        operator: nil,
        request_options: {}
      )
      end

      # Returns the audiences in the workspace with paging. Audiences are filter-based
      # groups that recalculate as user profiles change.
      sig do
        params(
          cursor: T.nilable(String),
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::Models::AudienceListResponse)
      end
      def list(
        # A unique identifier that allows for fetching the next set of audiences
        cursor: nil,
        request_options: {}
      )
      end

      # Deletes an audience permanently, so update any caller sending to it by audience
      # id first. Those sends fail once the audience is gone.
      sig do
        params(
          audience_id: String,
          request_options: Courier::RequestOptions::OrHash
        ).void
      end
      def delete(
        # A unique identifier representing the audience id
        audience_id,
        request_options: {}
      )
      end

      # Returns the users currently matching an audience filter, with paging. Membership
      # is recalculated, so results shift as profiles change.
      sig do
        params(
          audience_id: String,
          cursor: T.nilable(String),
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::Models::AudienceListMembersResponse)
      end
      def list_members(
        # A unique identifier representing the audience id
        audience_id,
        # A unique identifier that allows for fetching the next set of members
        cursor: nil,
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
