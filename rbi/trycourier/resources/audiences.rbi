# typed: strong

module Trycourier
  module Resources
    class Audiences
      # Returns the specified audience by id.
      sig do
        params(
          audience_id: String,
          request_options: Trycourier::RequestOptions::OrHash
        ).returns(Trycourier::Audience)
      end
      def retrieve(
        # A unique identifier representing the audience_id
        audience_id,
        request_options: {}
      )
      end

      # Creates or updates audience.
      sig do
        params(
          audience_id: String,
          description: T.nilable(String),
          filter:
            T.nilable(
              T.any(
                Trycourier::SingleFilterConfig::OrHash,
                Trycourier::NestedFilterConfig::OrHash
              )
            ),
          name: T.nilable(String),
          request_options: Trycourier::RequestOptions::OrHash
        ).returns(Trycourier::Models::AudienceUpdateResponse)
      end
      def update(
        # A unique identifier representing the audience id
        audience_id,
        # A description of the audience
        description: nil,
        # A single filter to use for filtering
        filter: nil,
        # The name of the audience
        name: nil,
        request_options: {}
      )
      end

      # Get the audiences associated with the authorization token.
      sig do
        params(
          cursor: T.nilable(String),
          request_options: Trycourier::RequestOptions::OrHash
        ).returns(Trycourier::Models::AudienceListResponse)
      end
      def list(
        # A unique identifier that allows for fetching the next set of audiences
        cursor: nil,
        request_options: {}
      )
      end

      # Deletes the specified audience.
      sig do
        params(
          audience_id: String,
          request_options: Trycourier::RequestOptions::OrHash
        ).void
      end
      def delete(
        # A unique identifier representing the audience id
        audience_id,
        request_options: {}
      )
      end

      # Get list of members of an audience.
      sig do
        params(
          audience_id: String,
          cursor: T.nilable(String),
          request_options: Trycourier::RequestOptions::OrHash
        ).returns(Trycourier::Models::AudienceListMembersResponse)
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
      sig { params(client: Trycourier::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
