# typed: strong

module Courier
  module Resources
    class Journeys
      sig { returns(Courier::Resources::Journeys::Templates) }
      attr_reader :templates

      # Create a journey. Defaults to `DRAFT` state; pass `state: "PUBLISHED"` to
      # publish on create. Send nodes are not allowed on `POST`. The standard flow is:
      # create the journey shell here, add notification templates with
      # `POST /journeys/{templateId}/templates`, then wire them into the journey with
      # `PUT /journeys/{templateId}`. Call `POST /journeys/{templateId}/publish` to
      # publish a draft after the fact.
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

      # Archive a journey. Archived journeys cannot be invoked. Existing journey runs
      # continue to completion.
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

      # Invoke a journey by id or alias to start a new run. The response includes a
      # `runId` identifying the run.
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

      # List published versions of a journey, ordered most recent first.
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

      # Publish the current draft as a new version. Body is optional; pass
      # `{ "version": "vN" }` to roll back to a prior version instead. Returns 404 if
      # the journey has no draft to publish.
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

      # Replace the journey draft. Updates the working draft only; call
      # `POST /journeys/{templateId}/publish` to make it live, or pass
      # `state: "PUBLISHED"` in this request to publish immediately. Send-node
      # `template` ids must already exist and be scoped to this journey, and node ids
      # must not be claimed by another journey.
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
