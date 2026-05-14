# typed: strong

module Courier
  module Resources
    class Journeys
      sig { returns(Courier::Resources::Journeys::Templates) }
      attr_reader :templates

      # Create a new journey. The journey is created in DRAFT state. Use POST
      # /journeys/{templateId}/publish to make it live.
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
                Courier::JourneyExitNode::OrHash,
                Courier::JourneyNode::JourneyBranchNode::OrHash
              )
            ],
          enabled: T::Boolean,
          state: Courier::JourneyState::OrSymbol,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::JourneyResponse)
      end
      def create(name:, nodes:, enabled: nil, state: nil, request_options: {})
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

      # Publish the current draft as a new version. Optionally rollback to a prior
      # version by passing `{ version: 'vN' }`.
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

      # Replace the journey draft. Updates the working draft only; call POST
      # /journeys/{templateId}/publish to make it live.
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
