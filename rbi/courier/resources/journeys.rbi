# typed: strong

module Courier
  module Resources
    class Journeys
      sig { returns(Courier::Resources::Journeys::Templates) }
      attr_reader :templates

      # Creates a journey from a set of nodes, in draft state unless you pass a
      # published state. Send nodes cannot be included until their templates exist.
      sig do
        params(
          name: String,
          nodes:
            T::Array[
              T.any(
                Courier::JourneyAPIInvokeTriggerNode::OrHash,
                Courier::JourneySegmentTriggerNode::OrHash,
                Courier::JourneySendNode::OrHash,
                Courier::JourneyDelayDurationNode::OrHash,
                Courier::JourneyDelayUntilNode::OrHash,
                Courier::JourneyFetchGetDeleteNode::OrHash,
                Courier::JourneyFetchPostPutNode::OrHash,
                Courier::JourneyAINode::OrHash,
                Courier::JourneyThrottleStaticNode::OrHash,
                Courier::JourneyThrottleDynamicNode::OrHash,
                Courier::JourneyNode::JourneyBatchNode::OrHash,
                Courier::JourneyNode::JourneyAddToDigestNode::OrHash,
                Courier::JourneyExitNode::OrHash,
                Courier::JourneyNode::JourneyBranchNode::OrHash
              )
            ],
          enabled: T::Boolean,
          state: Courier::JourneyState::OrSymbol,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::JourneyResponse)
      end
      def create(
        name:,
        nodes:,
        enabled: nil,
        # Lifecycle state of a journey.
        state: nil,
        request_options: {}
      )
      end

      # Fetch a journey by id. Pass `?version=draft` (default `published`) to retrieve
      # the working draft, or `?version=vN` to retrieve a historical version.
      sig do
        params(
          template_id: String,
          version: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::JourneyResponse)
      end
      def retrieve(
        # Journey id
        template_id,
        # Version selector: `draft`, `published` (default), or `vN`.
        version: nil,
        request_options: {}
      )
      end

      # Lists the workspace's journeys, each carrying a name, state, and enabled flag.
      # Paged by cursor.
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

      # Archives a journey so it can no longer be invoked. Runs already in flight
      # continue to completion, so archiving never strands a user mid-sequence.
      sig do
        params(
          template_id: String,
          request_options: Courier::RequestOptions::OrHash
        ).void
      end
      def archive(
        # Journey id
        template_id,
        request_options: {}
      )
      end

      # Cancels in-flight journey runs, either every run sharing a cancelation token or
      # one run by id. Use it to stop a sequence when the event resolves.
      sig do
        params(
          cancel_journey_request:
            T.any(
              Courier::CancelJourneyRequest::ByCancelationToken::OrHash,
              Courier::CancelJourneyRequest::ByRunID::OrHash
            ),
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::CancelJourneyResponse::Variants)
      end
      def cancel(
        # Request body for `POST /journeys/cancel`. Provide EXACTLY ONE of
        # `cancelation_token` (cancels every run associated with the token) or `run_id`
        # (cancels a single tenant-scoped run).
        cancel_journey_request:,
        request_options: {}
      )
      end

      # Starts a journey run for one user and returns a runId. Runs execute
      # asynchronously, so the response arrives before any message is sent.
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
        # A unique identifier representing the journey to be invoked. Accepts a Journey ID
        # or Journey Alias.
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

      # Lists a journey's published versions, most recent first, so you have a version
      # id to roll back to. Paged by cursor.
      sig do
        params(
          template_id: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::JourneyVersionsListResponse)
      end
      def list_versions(
        # Journey id
        template_id,
        request_options: {}
      )
      end

      # Publishes a journey's current draft as a new version, making it live for new
      # runs. Pass a version instead to roll back to an earlier one.
      sig do
        params(
          template_id: String,
          version: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::JourneyResponse)
      end
      def publish(
        # Journey id
        template_id,
        version: nil,
        request_options: {}
      )
      end

      # Replaces a journey's working draft, leaving the published version live until you
      # publish. Reach for this when editing a journey already running.
      sig do
        params(
          template_id: String,
          name: String,
          nodes:
            T::Array[
              T.any(
                Courier::JourneyAPIInvokeTriggerNode::OrHash,
                Courier::JourneySegmentTriggerNode::OrHash,
                Courier::JourneySendNode::OrHash,
                Courier::JourneyDelayDurationNode::OrHash,
                Courier::JourneyDelayUntilNode::OrHash,
                Courier::JourneyFetchGetDeleteNode::OrHash,
                Courier::JourneyFetchPostPutNode::OrHash,
                Courier::JourneyAINode::OrHash,
                Courier::JourneyThrottleStaticNode::OrHash,
                Courier::JourneyThrottleDynamicNode::OrHash,
                Courier::JourneyNode::JourneyBatchNode::OrHash,
                Courier::JourneyNode::JourneyAddToDigestNode::OrHash,
                Courier::JourneyExitNode::OrHash,
                Courier::JourneyNode::JourneyBranchNode::OrHash
              )
            ],
          enabled: T::Boolean,
          state: Courier::JourneyState::OrSymbol,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::JourneyResponse)
      end
      def replace(
        # Journey id
        template_id,
        name:,
        nodes:,
        enabled: nil,
        # Lifecycle state of a journey.
        state: nil,
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
