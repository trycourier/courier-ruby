# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Automations#invoke_ad_hoc
    class AutomationInvokeAdHocParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute automation
      #
      #   @return [Courier::Models::AutomationInvokeAdHocParams::Automation]
      required :automation, -> { Courier::AutomationInvokeAdHocParams::Automation }

      # @!attribute brand
      #
      #   @return [String, nil]
      optional :brand, String, nil?: true

      # @!attribute data
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :data, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown], nil?: true

      # @!attribute profile
      #
      #   @return [Object, nil]
      optional :profile, Courier::Internal::Type::Unknown

      # @!attribute recipient
      #
      #   @return [String, nil]
      optional :recipient, String, nil?: true

      # @!attribute template
      #
      #   @return [String, nil]
      optional :template, String, nil?: true

      # @!method initialize(automation:, brand: nil, data: nil, profile: nil, recipient: nil, template: nil, request_options: {})
      #   @param automation [Courier::Models::AutomationInvokeAdHocParams::Automation]
      #   @param brand [String, nil]
      #   @param data [Hash{Symbol=>Object}, nil]
      #   @param profile [Object]
      #   @param recipient [String, nil]
      #   @param template [String, nil]
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]

      class Automation < Courier::Internal::Type::BaseModel
        # @!attribute steps
        #
        #   @return [Array<Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToDigestStep, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationThrottleStep, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationCancelStep, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationDelayStep, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationFetchDataStep, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationInvokeStep, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationSendStep, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationV2SendStep, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationSendListStep, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationUpdateProfileStep>]
        required :steps,
                 -> { Courier::Internal::Type::ArrayOf[union: Courier::AutomationInvokeAdHocParams::Automation::Step] }

        # @!attribute cancelation_token
        #
        #   @return [String, nil]
        optional :cancelation_token, String, nil?: true

        # @!method initialize(steps:, cancelation_token: nil)
        #   @param steps [Array<Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToDigestStep, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationThrottleStep, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationCancelStep, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationDelayStep, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationFetchDataStep, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationInvokeStep, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationSendStep, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationV2SendStep, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationSendListStep, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationUpdateProfileStep>]
        #   @param cancelation_token [String, nil]

        module Step
          extend Courier::Internal::Type::Union

          variant -> { Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToDigestStep }

          variant -> { Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep }

          variant -> { Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationThrottleStep }

          variant -> { Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationCancelStep }

          variant -> { Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationDelayStep }

          variant -> { Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationFetchDataStep }

          variant -> { Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationInvokeStep }

          variant -> { Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationSendStep }

          variant -> { Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationV2SendStep }

          variant -> { Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationSendListStep }

          variant -> { Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationUpdateProfileStep }

          class AutomationAddToDigestStep < Courier::Models::Automations::AutomationStep
            # @!attribute action
            #
            #   @return [Symbol, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToDigestStep::Action]
            required :action,
                     enum: -> { Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToDigestStep::Action }

            # @!attribute subscription_topic_id
            #   The subscription topic that has digests enabled
            #
            #   @return [String]
            required :subscription_topic_id, String

            # @!method initialize(action:, subscription_topic_id:)
            #   @param action [Symbol, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToDigestStep::Action]
            #
            #   @param subscription_topic_id [String] The subscription topic that has digests enabled

            module Action
              extend Courier::Internal::Type::Enum

              ADD_TO_DIGEST = :"add-to-digest"

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          class AutomationAddToBatchStep < Courier::Models::Automations::AutomationStep
            # @!attribute action
            #
            #   @return [Symbol, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep::Action]
            required :action,
                     enum: -> { Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep::Action }

            # @!attribute max_wait_period
            #   Defines the maximum wait time before the batch should be released. Must be less
            #   than wait period. Maximum of 60 days. Specified as an
            #   [ISO 8601 duration](https://en.wikipedia.org/wiki/ISO_8601#Durations)
            #
            #   @return [String]
            required :max_wait_period, String

            # @!attribute retain
            #   Defines what items should be retained and passed along to the next steps when
            #   the batch is released
            #
            #   @return [Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep::Retain]
            required :retain,
                     -> { Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep::Retain }

            # @!attribute wait_period
            #   Defines the period of inactivity before the batch is released. Specified as an
            #   [ISO 8601 duration](https://en.wikipedia.org/wiki/ISO_8601#Durations)
            #
            #   @return [String]
            required :wait_period, String

            # @!attribute batch_id
            #
            #   @return [String, nil]
            optional :batch_id, String, nil?: true

            # @!attribute batch_key
            #   If using scope=dynamic, provide the key or a reference (e.g.,
            #   refs.data.batch_key)
            #
            #   @return [String, nil]
            optional :batch_key, String, nil?: true

            # @!attribute category_key
            #   Defines the field of the data object the batch is set to when complete. Defaults
            #   to `batch`
            #
            #   @return [String, nil]
            optional :category_key, String, nil?: true

            # @!attribute max_items
            #   If specified, the batch will release as soon as this number is reached
            #
            #   @return [String, Integer, nil]
            optional :max_items,
                     union: -> {
                       Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep::MaxItems
                     },
                     nil?: true

            # @!attribute scope
            #   Determine the scope of the batching. If user, chosen in this order: recipient,
            #   profile.user_id, data.user_id, data.userId. If dynamic, then specify where the
            #   batch_key or a reference to the batch_key
            #
            #   @return [Symbol, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep::Scope, nil]
            optional :scope,
                     enum: -> {
                       Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep::Scope
                     },
                     nil?: true

            # @!method initialize(action:, max_wait_period:, retain:, wait_period:, batch_id: nil, batch_key: nil, category_key: nil, max_items: nil, scope: nil)
            #   Some parameter documentations has been truncated, see
            #   {Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep}
            #   for more details.
            #
            #   @param action [Symbol, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep::Action]
            #
            #   @param max_wait_period [String] Defines the maximum wait time before the batch should be released. Must be less
            #
            #   @param retain [Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep::Retain] Defines what items should be retained and passed along to the next steps when th
            #
            #   @param wait_period [String] Defines the period of inactivity before the batch is released. Specified as an [
            #
            #   @param batch_id [String, nil]
            #
            #   @param batch_key [String, nil] If using scope=dynamic, provide the key or a reference (e.g., refs.data.batch_ke
            #
            #   @param category_key [String, nil] Defines the field of the data object the batch is set to when complete. Defaults
            #
            #   @param max_items [String, Integer, nil] If specified, the batch will release as soon as this number is reached
            #
            #   @param scope [Symbol, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep::Scope, nil] Determine the scope of the batching. If user, chosen in this order: recipient, p

            module Action
              extend Courier::Internal::Type::Enum

              ADD_TO_BATCH = :"add-to-batch"

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            class Retain < Courier::Internal::Type::BaseModel
              # @!attribute count
              #   The number of records to keep in batch. Default is 10 and only configurable by
              #   requesting from support. When configurable minimum is 2 and maximum is 100.
              #
              #   @return [Integer]
              required :count, Integer

              # @!attribute type
              #   Keep N number of notifications based on the type. First/Last N based on
              #   notification received. highest/lowest based on a scoring key providing in the
              #   data accessed by sort_key
              #
              #   @return [Symbol, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep::Retain::Type]
              required :type,
                       enum: -> { Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep::Retain::Type }

              # @!attribute sort_key
              #   Defines the data value data[sort_key] that is used to sort the stored items.
              #   Required when type is set to highest or lowest.
              #
              #   @return [String, nil]
              optional :sort_key, String, nil?: true

              # @!method initialize(count:, type:, sort_key: nil)
              #   Some parameter documentations has been truncated, see
              #   {Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep::Retain}
              #   for more details.
              #
              #   Defines what items should be retained and passed along to the next steps when
              #   the batch is released
              #
              #   @param count [Integer] The number of records to keep in batch. Default is 10 and only configurable by r
              #
              #   @param type [Symbol, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep::Retain::Type] Keep N number of notifications based on the type. First/Last N based on notifica
              #
              #   @param sort_key [String, nil] Defines the data value data[sort_key] that is used to sort the stored items. Req

              # Keep N number of notifications based on the type. First/Last N based on
              # notification received. highest/lowest based on a scoring key providing in the
              # data accessed by sort_key
              #
              # @see Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep::Retain#type
              module Type
                extend Courier::Internal::Type::Enum

                FIRST = :first
                LAST = :last
                HIGHEST = :highest
                LOWEST = :lowest

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # If specified, the batch will release as soon as this number is reached
            module MaxItems
              extend Courier::Internal::Type::Union

              variant String

              variant Integer

              # @!method self.variants
              #   @return [Array(String, Integer)]
            end

            # Determine the scope of the batching. If user, chosen in this order: recipient,
            # profile.user_id, data.user_id, data.userId. If dynamic, then specify where the
            # batch_key or a reference to the batch_key
            module Scope
              extend Courier::Internal::Type::Enum

              USER = :user
              GLOBAL = :global
              DYNAMIC = :dynamic

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          class AutomationThrottleStep < Courier::Models::Automations::AutomationStep
            # @!attribute action
            #
            #   @return [Symbol, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationThrottleStep::Action]
            required :action,
                     enum: -> { Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationThrottleStep::Action }

            # @!attribute max_allowed
            #   Maximum number of allowed notifications in that timeframe
            #
            #   @return [Integer]
            required :max_allowed, Integer

            # @!attribute on_throttle
            #
            #   @return [Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationThrottleStep::OnThrottle]
            required :on_throttle,
                     -> { Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationThrottleStep::OnThrottle }

            # @!attribute period
            #   Defines the throttle period which corresponds to the max_allowed. Specified as
            #   an ISO 8601 duration, https://en.wikipedia.org/wiki/ISO_8601#Durations
            #
            #   @return [String]
            required :period, String

            # @!attribute scope
            #
            #   @return [Symbol, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationThrottleStep::Scope]
            required :scope,
                     enum: -> { Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationThrottleStep::Scope }

            # @!attribute should_alert
            #   Value must be true
            #
            #   @return [Boolean]
            required :should_alert, Courier::Internal::Type::Boolean

            # @!attribute throttle_key
            #   If using scope=dynamic, provide the reference (e.g., refs.data.throttle_key) to
            #   the how the throttle should be identified
            #
            #   @return [String, nil]
            optional :throttle_key, String, nil?: true

            # @!method initialize(action:, max_allowed:, on_throttle:, period:, scope:, should_alert:, throttle_key: nil)
            #   Some parameter documentations has been truncated, see
            #   {Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationThrottleStep}
            #   for more details.
            #
            #   @param action [Symbol, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationThrottleStep::Action]
            #
            #   @param max_allowed [Integer] Maximum number of allowed notifications in that timeframe
            #
            #   @param on_throttle [Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationThrottleStep::OnThrottle]
            #
            #   @param period [String] Defines the throttle period which corresponds to the max_allowed. Specified as a
            #
            #   @param scope [Symbol, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationThrottleStep::Scope]
            #
            #   @param should_alert [Boolean] Value must be true
            #
            #   @param throttle_key [String, nil] If using scope=dynamic, provide the reference (e.g., refs.data.throttle_key) to

            module Action
              extend Courier::Internal::Type::Enum

              THROTTLE = :throttle

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            class OnThrottle < Courier::Internal::Type::BaseModel
              # @!attribute node_id
              #   The node to go to if the request is throttled
              #
              #   @return [String]
              required :node_id, String, api_name: :$node_id

              # @!method initialize(node_id:)
              #   @param node_id [String] The node to go to if the request is throttled
            end

            module Scope
              extend Courier::Internal::Type::Enum

              USER = :user
              GLOBAL = :global
              DYNAMIC = :dynamic

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          class AutomationCancelStep < Courier::Models::Automations::AutomationStep
            # @!attribute action
            #
            #   @return [Symbol, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationCancelStep::Action]
            required :action,
                     enum: -> { Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationCancelStep::Action }

            # @!attribute cancelation_token
            #
            #   @return [String, nil]
            optional :cancelation_token, String, nil?: true

            # @!method initialize(action:, cancelation_token: nil)
            #   @param action [Symbol, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationCancelStep::Action]
            #   @param cancelation_token [String, nil]

            module Action
              extend Courier::Internal::Type::Enum

              CANCEL = :cancel

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          class AutomationDelayStep < Courier::Models::Automations::AutomationStep
            # @!attribute action
            #
            #   @return [Symbol, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationDelayStep::Action]
            required :action,
                     enum: -> { Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationDelayStep::Action }

            # @!attribute duration
            #   The [ISO 8601 duration](https://en.wikipedia.org/wiki/ISO_8601#Durations) string
            #   for how long to delay for
            #
            #   @return [String, nil]
            optional :duration, String, nil?: true

            # @!attribute until_
            #   The ISO 8601 timestamp for when the delay should end
            #
            #   @return [String, nil]
            optional :until_, String, api_name: :until, nil?: true

            # @!method initialize(action:, duration: nil, until_: nil)
            #   Some parameter documentations has been truncated, see
            #   {Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationDelayStep}
            #   for more details.
            #
            #   @param action [Symbol, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationDelayStep::Action]
            #
            #   @param duration [String, nil] The [ISO 8601 duration](https://en.wikipedia.org/wiki/ISO_8601#Durations) string
            #
            #   @param until_ [String, nil] The ISO 8601 timestamp for when the delay should end

            module Action
              extend Courier::Internal::Type::Enum

              DELAY = :delay

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          class AutomationFetchDataStep < Courier::Models::Automations::AutomationStep
            # @!attribute action
            #
            #   @return [Symbol, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Action]
            required :action,
                     enum: -> { Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Action }

            # @!attribute merge_strategy
            #
            #   @return [Symbol, Courier::Models::Automations::MergeAlgorithm]
            required :merge_strategy, enum: -> { Courier::Automations::MergeAlgorithm }

            # @!attribute webhook
            #
            #   @return [Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Webhook]
            required :webhook,
                     -> { Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Webhook }

            # @!attribute idempotency_expiry
            #
            #   @return [String, nil]
            optional :idempotency_expiry, String, nil?: true

            # @!attribute idempotency_key
            #
            #   @return [String, nil]
            optional :idempotency_key, String, nil?: true

            # @!method initialize(action:, merge_strategy:, webhook:, idempotency_expiry: nil, idempotency_key: nil)
            #   @param action [Symbol, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Action]
            #   @param merge_strategy [Symbol, Courier::Models::Automations::MergeAlgorithm]
            #   @param webhook [Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Webhook]
            #   @param idempotency_expiry [String, nil]
            #   @param idempotency_key [String, nil]

            module Action
              extend Courier::Internal::Type::Enum

              FETCH_DATA = :"fetch-data"

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            class Webhook < Courier::Internal::Type::BaseModel
              # @!attribute method_
              #
              #   @return [Symbol, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Webhook::Method]
              required :method_,
                       enum: -> {
                         Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Webhook::Method
                       },
                       api_name: :method

              # @!attribute url
              #
              #   @return [String]
              required :url, String

              # @!attribute body
              #
              #   @return [Hash{Symbol=>Object}, nil]
              optional :body, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown], nil?: true

              # @!attribute headers
              #
              #   @return [Hash{Symbol=>Object}, nil]
              optional :headers, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown], nil?: true

              # @!attribute params
              #
              #   @return [Hash{Symbol=>Object}, nil]
              optional :params, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown], nil?: true

              # @!method initialize(method_:, url:, body: nil, headers: nil, params: nil)
              #   @param method_ [Symbol, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Webhook::Method]
              #   @param url [String]
              #   @param body [Hash{Symbol=>Object}, nil]
              #   @param headers [Hash{Symbol=>Object}, nil]
              #   @param params [Hash{Symbol=>Object}, nil]

              # @see Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Webhook#method_
              module Method
                extend Courier::Internal::Type::Enum

                GET = :GET
                POST = :POST

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end
          end

          class AutomationInvokeStep < Courier::Models::Automations::AutomationStep
            # @!attribute action
            #
            #   @return [Symbol, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationInvokeStep::Action]
            required :action,
                     enum: -> { Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationInvokeStep::Action }

            # @!attribute template
            #
            #   @return [String]
            required :template, String

            # @!method initialize(action:, template:)
            #   @param action [Symbol, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationInvokeStep::Action]
            #   @param template [String]

            module Action
              extend Courier::Internal::Type::Enum

              INVOKE = :invoke

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          class AutomationSendStep < Courier::Models::Automations::AutomationStep
            # @!attribute action
            #
            #   @return [Symbol, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationSendStep::Action]
            required :action,
                     enum: -> { Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationSendStep::Action }

            # @!attribute brand
            #
            #   @return [String, nil]
            optional :brand, String, nil?: true

            # @!attribute data
            #
            #   @return [Hash{Symbol=>Object}, nil]
            optional :data, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown], nil?: true

            # @!attribute override
            #
            #   @return [Hash{Symbol=>Object}, nil]
            optional :override, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown], nil?: true

            # @!attribute profile
            #
            #   @return [Object, nil]
            optional :profile, Courier::Internal::Type::Unknown

            # @!attribute recipient
            #
            #   @return [String, nil]
            optional :recipient, String, nil?: true

            # @!attribute template
            #
            #   @return [String, nil]
            optional :template, String, nil?: true

            # @!method initialize(action:, brand: nil, data: nil, override: nil, profile: nil, recipient: nil, template: nil)
            #   @param action [Symbol, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationSendStep::Action]
            #   @param brand [String, nil]
            #   @param data [Hash{Symbol=>Object}, nil]
            #   @param override [Hash{Symbol=>Object}, nil]
            #   @param profile [Object]
            #   @param recipient [String, nil]
            #   @param template [String, nil]

            module Action
              extend Courier::Internal::Type::Enum

              SEND = :send

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          class AutomationV2SendStep < Courier::Models::Automations::AutomationStep
            # @!attribute action
            #
            #   @return [Symbol, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationV2SendStep::Action]
            required :action,
                     enum: -> { Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationV2SendStep::Action }

            # @!attribute message
            #   Describes the content of the message in a way that will work for email, push,
            #   chat, or any channel.
            #
            #   @return [Courier::Models::Message::ContentMessage, Courier::Models::Message::TemplateMessage]
            required :message, union: -> { Courier::Message }

            # @!method initialize(action:, message:)
            #   Some parameter documentations has been truncated, see
            #   {Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationV2SendStep}
            #   for more details.
            #
            #   @param action [Symbol, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationV2SendStep::Action]
            #
            #   @param message [Courier::Models::Message::ContentMessage, Courier::Models::Message::TemplateMessage] Describes the content of the message in a way that will work for email, push, ch

            module Action
              extend Courier::Internal::Type::Enum

              SEND = :send

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          class AutomationSendListStep < Courier::Models::Automations::AutomationStep
            # @!attribute action
            #
            #   @return [Symbol, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationSendListStep::Action]
            required :action,
                     enum: -> { Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationSendListStep::Action }

            # @!attribute list
            #
            #   @return [String]
            required :list, String

            # @!attribute brand
            #
            #   @return [String, nil]
            optional :brand, String, nil?: true

            # @!attribute data
            #
            #   @return [Hash{Symbol=>Object}, nil]
            optional :data, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown], nil?: true

            # @!attribute override
            #
            #   @return [Hash{Symbol=>Object}, nil]
            optional :override, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown], nil?: true

            # @!attribute template
            #
            #   @return [String, nil]
            optional :template, String, nil?: true

            # @!method initialize(action:, list:, brand: nil, data: nil, override: nil, template: nil)
            #   @param action [Symbol, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationSendListStep::Action]
            #   @param list [String]
            #   @param brand [String, nil]
            #   @param data [Hash{Symbol=>Object}, nil]
            #   @param override [Hash{Symbol=>Object}, nil]
            #   @param template [String, nil]

            module Action
              extend Courier::Internal::Type::Enum

              SEND_LIST = :"send-list"

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          class AutomationUpdateProfileStep < Courier::Internal::Type::BaseModel
            # @!attribute action
            #
            #   @return [Symbol, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationUpdateProfileStep::Action]
            required :action,
                     enum: -> { Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationUpdateProfileStep::Action }

            # @!attribute merge
            #
            #   @return [Symbol, Courier::Models::Automations::MergeAlgorithm]
            required :merge, enum: -> { Courier::Automations::MergeAlgorithm }

            # @!attribute profile
            #
            #   @return [Object]
            required :profile, Courier::Internal::Type::Unknown

            # @!attribute recipient_id
            #
            #   @return [String]
            required :recipient_id, String

            # @!method initialize(action:, merge:, profile:, recipient_id:)
            #   @param action [Symbol, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationUpdateProfileStep::Action]
            #   @param merge [Symbol, Courier::Models::Automations::MergeAlgorithm]
            #   @param profile [Object]
            #   @param recipient_id [String]

            # @see Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationUpdateProfileStep#action
            module Action
              extend Courier::Internal::Type::Enum

              UPDATE_PROFILE = :"update-profile"

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @!method self.variants
          #   @return [Array(Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToDigestStep, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationThrottleStep, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationCancelStep, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationDelayStep, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationFetchDataStep, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationInvokeStep, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationSendStep, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationV2SendStep, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationSendListStep, Courier::Models::AutomationInvokeAdHocParams::Automation::Step::AutomationUpdateProfileStep)]
        end
      end
    end
  end
end
