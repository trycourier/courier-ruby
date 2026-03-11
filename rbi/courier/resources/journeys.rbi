# typed: strong

module Courier
  module Resources
    class Journeys
      # Get the list of journeys.
      sig do
        params(
          cursor: String,
          version: Courier::JourneyListParams::Version::OrSymbol,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::JourneysListResponse)
      end
      def list(
        # A cursor token for pagination. Use the cursor from the previous response to
        # fetch the next page of results.
        cursor: nil,
        # The version of journeys to retrieve. Accepted values are published (for
        # published journeys) or draft (for draft journeys). Defaults to published.
        version: nil,
        request_options: {}
      )
      end

      # Invoke a journey run from a journey template.
      sig do
        params(
          template_id: String,
          data: T::Hash[Symbol, T.anything],
          profile: T::Hash[Symbol, T.anything],
          user_id: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::JourneysInvokeResponse)
      end
      def invoke(
        # A unique identifier representing the journey template to be invoked. This could
        # be the Journey Template ID or the Journey Template Alias.
        template_id,
        # Data payload passed to the journey. The expected shape can be predefined using
        # the schema builder in the journey editor. This data is available in journey
        # steps for condition evaluation and template variable interpolation. Can also
        # contain user identifiers (user_id, userId, anonymousId) if not provided
        # elsewhere.
        data: nil,
        # Profile data for the user. Can contain contact information (email,
        # phone_number), user identifiers (user_id, userId, anonymousId), or any custom
        # profile fields. Profile fields are merged with any existing stored profile for
        # the user. Include context.tenant_id to load a tenant-scoped profile for
        # multi-tenant scenarios.
        profile: nil,
        # A unique identifier for the user. If not provided, the system will attempt to
        # resolve the user identifier from profile or data objects.
        user_id: nil,
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
