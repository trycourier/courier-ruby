# typed: strong

module Courier
  module Models
    class AutomationInvokeAdHocParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Courier::AutomationInvokeAdHocParams,
            Courier::Internal::AnyHash
          )
        end

      sig { returns(Courier::AutomationInvokeAdHocParams::Automation) }
      attr_reader :automation

      sig do
        params(
          automation: Courier::AutomationInvokeAdHocParams::Automation::OrHash
        ).void
      end
      attr_writer :automation

      sig { returns(T.nilable(String)) }
      attr_accessor :brand

      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_accessor :data

      sig { returns(T.nilable(T.anything)) }
      attr_reader :profile

      sig { params(profile: T.anything).void }
      attr_writer :profile

      sig { returns(T.nilable(String)) }
      attr_accessor :recipient

      sig { returns(T.nilable(String)) }
      attr_accessor :template

      sig do
        params(
          automation: Courier::AutomationInvokeAdHocParams::Automation::OrHash,
          brand: T.nilable(String),
          data: T.nilable(T::Hash[Symbol, T.anything]),
          profile: T.anything,
          recipient: T.nilable(String),
          template: T.nilable(String),
          request_options: Courier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        automation:,
        brand: nil,
        data: nil,
        profile: nil,
        recipient: nil,
        template: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            automation: Courier::AutomationInvokeAdHocParams::Automation,
            brand: T.nilable(String),
            data: T.nilable(T::Hash[Symbol, T.anything]),
            profile: T.anything,
            recipient: T.nilable(String),
            template: T.nilable(String),
            request_options: Courier::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Automation < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::AutomationInvokeAdHocParams::Automation,
              Courier::Internal::AnyHash
            )
          end

        sig do
          returns(
            T::Array[
              T.any(
                Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToDigestStep,
                Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep,
                Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationThrottleStep,
                Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationCancelStep,
                Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationDelayStep,
                Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationFetchDataStep,
                Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationInvokeStep,
                Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationSendStep,
                Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationV2SendStep,
                Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationSendListStep,
                Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationUpdateProfileStep
              )
            ]
          )
        end
        attr_accessor :steps

        sig { returns(T.nilable(String)) }
        attr_accessor :cancelation_token

        sig do
          params(
            steps:
              T::Array[
                T.any(
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToDigestStep::OrHash,
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep::OrHash,
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationThrottleStep::OrHash,
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationCancelStep::OrHash,
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationDelayStep::OrHash,
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::OrHash,
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationInvokeStep::OrHash,
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationSendStep::OrHash,
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationV2SendStep::OrHash,
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationSendListStep::OrHash,
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationUpdateProfileStep::OrHash
                )
              ],
            cancelation_token: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(steps:, cancelation_token: nil)
        end

        sig do
          override.returns(
            {
              steps:
                T::Array[
                  T.any(
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToDigestStep,
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep,
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationThrottleStep,
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationCancelStep,
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationDelayStep,
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationFetchDataStep,
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationInvokeStep,
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationSendStep,
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationV2SendStep,
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationSendListStep,
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationUpdateProfileStep
                  )
                ],
              cancelation_token: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        module Step
          extend Courier::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToDigestStep,
                Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep,
                Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationThrottleStep,
                Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationCancelStep,
                Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationDelayStep,
                Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationFetchDataStep,
                Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationInvokeStep,
                Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationSendStep,
                Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationV2SendStep,
                Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationSendListStep,
                Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationUpdateProfileStep
              )
            end

          class AutomationAddToDigestStep < Courier::Models::Automations::AutomationStep
            OrHash =
              T.type_alias do
                T.any(
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToDigestStep,
                  Courier::Internal::AnyHash
                )
              end

            sig do
              returns(
                Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToDigestStep::Action::OrSymbol
              )
            end
            attr_accessor :action

            # The subscription topic that has digests enabled
            sig { returns(String) }
            attr_accessor :subscription_topic_id

            sig do
              params(
                action:
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToDigestStep::Action::OrSymbol,
                subscription_topic_id: String
              ).returns(T.attached_class)
            end
            def self.new(
              action:,
              # The subscription topic that has digests enabled
              subscription_topic_id:
            )
            end

            sig do
              override.returns(
                {
                  action:
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToDigestStep::Action::OrSymbol,
                  subscription_topic_id: String
                }
              )
            end
            def to_hash
            end

            module Action
              extend Courier::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToDigestStep::Action
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              ADD_TO_DIGEST =
                T.let(
                  :"add-to-digest",
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToDigestStep::Action::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToDigestStep::Action::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class AutomationAddToBatchStep < Courier::Models::Automations::AutomationStep
            OrHash =
              T.type_alias do
                T.any(
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep,
                  Courier::Internal::AnyHash
                )
              end

            sig do
              returns(
                Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep::Action::OrSymbol
              )
            end
            attr_accessor :action

            # Defines the maximum wait time before the batch should be released. Must be less
            # than wait period. Maximum of 60 days. Specified as an
            # [ISO 8601 duration](https://en.wikipedia.org/wiki/ISO_8601#Durations)
            sig { returns(String) }
            attr_accessor :max_wait_period

            # Defines what items should be retained and passed along to the next steps when
            # the batch is released
            sig do
              returns(
                Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep::Retain
              )
            end
            attr_reader :retain

            sig do
              params(
                retain:
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep::Retain::OrHash
              ).void
            end
            attr_writer :retain

            # Defines the period of inactivity before the batch is released. Specified as an
            # [ISO 8601 duration](https://en.wikipedia.org/wiki/ISO_8601#Durations)
            sig { returns(String) }
            attr_accessor :wait_period

            sig { returns(T.nilable(String)) }
            attr_accessor :batch_id

            # If using scope=dynamic, provide the key or a reference (e.g.,
            # refs.data.batch_key)
            sig { returns(T.nilable(String)) }
            attr_accessor :batch_key

            # Defines the field of the data object the batch is set to when complete. Defaults
            # to `batch`
            sig { returns(T.nilable(String)) }
            attr_accessor :category_key

            # If specified, the batch will release as soon as this number is reached
            sig do
              returns(
                T.nilable(
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep::MaxItems::Variants
                )
              )
            end
            attr_accessor :max_items

            # Determine the scope of the batching. If user, chosen in this order: recipient,
            # profile.user_id, data.user_id, data.userId. If dynamic, then specify where the
            # batch_key or a reference to the batch_key
            sig do
              returns(
                T.nilable(
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep::Scope::OrSymbol
                )
              )
            end
            attr_accessor :scope

            sig do
              params(
                action:
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep::Action::OrSymbol,
                max_wait_period: String,
                retain:
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep::Retain::OrHash,
                wait_period: String,
                batch_id: T.nilable(String),
                batch_key: T.nilable(String),
                category_key: T.nilable(String),
                max_items:
                  T.nilable(
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep::MaxItems::Variants
                  ),
                scope:
                  T.nilable(
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep::Scope::OrSymbol
                  )
              ).returns(T.attached_class)
            end
            def self.new(
              action:,
              # Defines the maximum wait time before the batch should be released. Must be less
              # than wait period. Maximum of 60 days. Specified as an
              # [ISO 8601 duration](https://en.wikipedia.org/wiki/ISO_8601#Durations)
              max_wait_period:,
              # Defines what items should be retained and passed along to the next steps when
              # the batch is released
              retain:,
              # Defines the period of inactivity before the batch is released. Specified as an
              # [ISO 8601 duration](https://en.wikipedia.org/wiki/ISO_8601#Durations)
              wait_period:,
              batch_id: nil,
              # If using scope=dynamic, provide the key or a reference (e.g.,
              # refs.data.batch_key)
              batch_key: nil,
              # Defines the field of the data object the batch is set to when complete. Defaults
              # to `batch`
              category_key: nil,
              # If specified, the batch will release as soon as this number is reached
              max_items: nil,
              # Determine the scope of the batching. If user, chosen in this order: recipient,
              # profile.user_id, data.user_id, data.userId. If dynamic, then specify where the
              # batch_key or a reference to the batch_key
              scope: nil
            )
            end

            sig do
              override.returns(
                {
                  action:
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep::Action::OrSymbol,
                  max_wait_period: String,
                  retain:
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep::Retain,
                  wait_period: String,
                  batch_id: T.nilable(String),
                  batch_key: T.nilable(String),
                  category_key: T.nilable(String),
                  max_items:
                    T.nilable(
                      Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep::MaxItems::Variants
                    ),
                  scope:
                    T.nilable(
                      Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep::Scope::OrSymbol
                    )
                }
              )
            end
            def to_hash
            end

            module Action
              extend Courier::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep::Action
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              ADD_TO_BATCH =
                T.let(
                  :"add-to-batch",
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep::Action::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep::Action::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            class Retain < Courier::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep::Retain,
                    Courier::Internal::AnyHash
                  )
                end

              # The number of records to keep in batch. Default is 10 and only configurable by
              # requesting from support. When configurable minimum is 2 and maximum is 100.
              sig { returns(Integer) }
              attr_accessor :count

              # Keep N number of notifications based on the type. First/Last N based on
              # notification received. highest/lowest based on a scoring key providing in the
              # data accessed by sort_key
              sig do
                returns(
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep::Retain::Type::OrSymbol
                )
              end
              attr_accessor :type

              # Defines the data value data[sort_key] that is used to sort the stored items.
              # Required when type is set to highest or lowest.
              sig { returns(T.nilable(String)) }
              attr_accessor :sort_key

              # Defines what items should be retained and passed along to the next steps when
              # the batch is released
              sig do
                params(
                  count: Integer,
                  type:
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep::Retain::Type::OrSymbol,
                  sort_key: T.nilable(String)
                ).returns(T.attached_class)
              end
              def self.new(
                # The number of records to keep in batch. Default is 10 and only configurable by
                # requesting from support. When configurable minimum is 2 and maximum is 100.
                count:,
                # Keep N number of notifications based on the type. First/Last N based on
                # notification received. highest/lowest based on a scoring key providing in the
                # data accessed by sort_key
                type:,
                # Defines the data value data[sort_key] that is used to sort the stored items.
                # Required when type is set to highest or lowest.
                sort_key: nil
              )
              end

              sig do
                override.returns(
                  {
                    count: Integer,
                    type:
                      Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep::Retain::Type::OrSymbol,
                    sort_key: T.nilable(String)
                  }
                )
              end
              def to_hash
              end

              # Keep N number of notifications based on the type. First/Last N based on
              # notification received. highest/lowest based on a scoring key providing in the
              # data accessed by sort_key
              module Type
                extend Courier::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep::Retain::Type
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                FIRST =
                  T.let(
                    :first,
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep::Retain::Type::TaggedSymbol
                  )
                LAST =
                  T.let(
                    :last,
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep::Retain::Type::TaggedSymbol
                  )
                HIGHEST =
                  T.let(
                    :highest,
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep::Retain::Type::TaggedSymbol
                  )
                LOWEST =
                  T.let(
                    :lowest,
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep::Retain::Type::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep::Retain::Type::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            # If specified, the batch will release as soon as this number is reached
            module MaxItems
              extend Courier::Internal::Type::Union

              Variants = T.type_alias { T.any(String, Integer) }

              sig do
                override.returns(
                  T::Array[
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep::MaxItems::Variants
                  ]
                )
              end
              def self.variants
              end
            end

            # Determine the scope of the batching. If user, chosen in this order: recipient,
            # profile.user_id, data.user_id, data.userId. If dynamic, then specify where the
            # batch_key or a reference to the batch_key
            module Scope
              extend Courier::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep::Scope
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              USER =
                T.let(
                  :user,
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep::Scope::TaggedSymbol
                )
              GLOBAL =
                T.let(
                  :global,
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep::Scope::TaggedSymbol
                )
              DYNAMIC =
                T.let(
                  :dynamic,
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep::Scope::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationAddToBatchStep::Scope::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class AutomationThrottleStep < Courier::Models::Automations::AutomationStep
            OrHash =
              T.type_alias do
                T.any(
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationThrottleStep,
                  Courier::Internal::AnyHash
                )
              end

            sig do
              returns(
                Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationThrottleStep::Action::OrSymbol
              )
            end
            attr_accessor :action

            # Maximum number of allowed notifications in that timeframe
            sig { returns(Integer) }
            attr_accessor :max_allowed

            sig do
              returns(
                Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationThrottleStep::OnThrottle
              )
            end
            attr_reader :on_throttle

            sig do
              params(
                on_throttle:
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationThrottleStep::OnThrottle::OrHash
              ).void
            end
            attr_writer :on_throttle

            # Defines the throttle period which corresponds to the max_allowed. Specified as
            # an ISO 8601 duration, https://en.wikipedia.org/wiki/ISO_8601#Durations
            sig { returns(String) }
            attr_accessor :period

            sig do
              returns(
                Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationThrottleStep::Scope::OrSymbol
              )
            end
            attr_accessor :scope

            # Value must be true
            sig { returns(T::Boolean) }
            attr_accessor :should_alert

            # If using scope=dynamic, provide the reference (e.g., refs.data.throttle_key) to
            # the how the throttle should be identified
            sig { returns(T.nilable(String)) }
            attr_accessor :throttle_key

            sig do
              params(
                action:
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationThrottleStep::Action::OrSymbol,
                max_allowed: Integer,
                on_throttle:
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationThrottleStep::OnThrottle::OrHash,
                period: String,
                scope:
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationThrottleStep::Scope::OrSymbol,
                should_alert: T::Boolean,
                throttle_key: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(
              action:,
              # Maximum number of allowed notifications in that timeframe
              max_allowed:,
              on_throttle:,
              # Defines the throttle period which corresponds to the max_allowed. Specified as
              # an ISO 8601 duration, https://en.wikipedia.org/wiki/ISO_8601#Durations
              period:,
              scope:,
              # Value must be true
              should_alert:,
              # If using scope=dynamic, provide the reference (e.g., refs.data.throttle_key) to
              # the how the throttle should be identified
              throttle_key: nil
            )
            end

            sig do
              override.returns(
                {
                  action:
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationThrottleStep::Action::OrSymbol,
                  max_allowed: Integer,
                  on_throttle:
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationThrottleStep::OnThrottle,
                  period: String,
                  scope:
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationThrottleStep::Scope::OrSymbol,
                  should_alert: T::Boolean,
                  throttle_key: T.nilable(String)
                }
              )
            end
            def to_hash
            end

            module Action
              extend Courier::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationThrottleStep::Action
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              THROTTLE =
                T.let(
                  :throttle,
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationThrottleStep::Action::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationThrottleStep::Action::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            class OnThrottle < Courier::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationThrottleStep::OnThrottle,
                    Courier::Internal::AnyHash
                  )
                end

              # The node to go to if the request is throttled
              sig { returns(String) }
              attr_accessor :node_id

              sig { params(node_id: String).returns(T.attached_class) }
              def self.new(
                # The node to go to if the request is throttled
                node_id:
              )
              end

              sig { override.returns({ node_id: String }) }
              def to_hash
              end
            end

            module Scope
              extend Courier::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationThrottleStep::Scope
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              USER =
                T.let(
                  :user,
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationThrottleStep::Scope::TaggedSymbol
                )
              GLOBAL =
                T.let(
                  :global,
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationThrottleStep::Scope::TaggedSymbol
                )
              DYNAMIC =
                T.let(
                  :dynamic,
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationThrottleStep::Scope::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationThrottleStep::Scope::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class AutomationCancelStep < Courier::Models::Automations::AutomationStep
            OrHash =
              T.type_alias do
                T.any(
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationCancelStep,
                  Courier::Internal::AnyHash
                )
              end

            sig do
              returns(
                Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationCancelStep::Action::OrSymbol
              )
            end
            attr_accessor :action

            sig { returns(T.nilable(String)) }
            attr_accessor :cancelation_token

            sig do
              params(
                action:
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationCancelStep::Action::OrSymbol,
                cancelation_token: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(action:, cancelation_token: nil)
            end

            sig do
              override.returns(
                {
                  action:
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationCancelStep::Action::OrSymbol,
                  cancelation_token: T.nilable(String)
                }
              )
            end
            def to_hash
            end

            module Action
              extend Courier::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationCancelStep::Action
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              CANCEL =
                T.let(
                  :cancel,
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationCancelStep::Action::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationCancelStep::Action::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class AutomationDelayStep < Courier::Models::Automations::AutomationStep
            OrHash =
              T.type_alias do
                T.any(
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationDelayStep,
                  Courier::Internal::AnyHash
                )
              end

            sig do
              returns(
                Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationDelayStep::Action::OrSymbol
              )
            end
            attr_accessor :action

            # The [ISO 8601 duration](https://en.wikipedia.org/wiki/ISO_8601#Durations) string
            # for how long to delay for
            sig { returns(T.nilable(String)) }
            attr_accessor :duration

            # The ISO 8601 timestamp for when the delay should end
            sig { returns(T.nilable(String)) }
            attr_accessor :until_

            sig do
              params(
                action:
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationDelayStep::Action::OrSymbol,
                duration: T.nilable(String),
                until_: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(
              action:,
              # The [ISO 8601 duration](https://en.wikipedia.org/wiki/ISO_8601#Durations) string
              # for how long to delay for
              duration: nil,
              # The ISO 8601 timestamp for when the delay should end
              until_: nil
            )
            end

            sig do
              override.returns(
                {
                  action:
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationDelayStep::Action::OrSymbol,
                  duration: T.nilable(String),
                  until_: T.nilable(String)
                }
              )
            end
            def to_hash
            end

            module Action
              extend Courier::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationDelayStep::Action
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              DELAY =
                T.let(
                  :delay,
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationDelayStep::Action::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationDelayStep::Action::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class AutomationFetchDataStep < Courier::Models::Automations::AutomationStep
            OrHash =
              T.type_alias do
                T.any(
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationFetchDataStep,
                  Courier::Internal::AnyHash
                )
              end

            sig do
              returns(
                Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Action::OrSymbol
              )
            end
            attr_accessor :action

            sig { returns(Courier::Automations::MergeAlgorithm::OrSymbol) }
            attr_accessor :merge_strategy

            sig do
              returns(
                Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Webhook
              )
            end
            attr_reader :webhook

            sig do
              params(
                webhook:
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Webhook::OrHash
              ).void
            end
            attr_writer :webhook

            sig { returns(T.nilable(String)) }
            attr_accessor :idempotency_expiry

            sig { returns(T.nilable(String)) }
            attr_accessor :idempotency_key

            sig do
              params(
                action:
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Action::OrSymbol,
                merge_strategy: Courier::Automations::MergeAlgorithm::OrSymbol,
                webhook:
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Webhook::OrHash,
                idempotency_expiry: T.nilable(String),
                idempotency_key: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(
              action:,
              merge_strategy:,
              webhook:,
              idempotency_expiry: nil,
              idempotency_key: nil
            )
            end

            sig do
              override.returns(
                {
                  action:
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Action::OrSymbol,
                  merge_strategy:
                    Courier::Automations::MergeAlgorithm::OrSymbol,
                  webhook:
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Webhook,
                  idempotency_expiry: T.nilable(String),
                  idempotency_key: T.nilable(String)
                }
              )
            end
            def to_hash
            end

            module Action
              extend Courier::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Action
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              FETCH_DATA =
                T.let(
                  :"fetch-data",
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Action::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Action::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            class Webhook < Courier::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Webhook,
                    Courier::Internal::AnyHash
                  )
                end

              sig do
                returns(
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Webhook::Method::OrSymbol
                )
              end
              attr_accessor :method_

              sig { returns(String) }
              attr_accessor :url

              sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
              attr_accessor :body

              sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
              attr_accessor :headers

              sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
              attr_accessor :params

              sig do
                params(
                  method_:
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Webhook::Method::OrSymbol,
                  url: String,
                  body: T.nilable(T::Hash[Symbol, T.anything]),
                  headers: T.nilable(T::Hash[Symbol, T.anything]),
                  params: T.nilable(T::Hash[Symbol, T.anything])
                ).returns(T.attached_class)
              end
              def self.new(method_:, url:, body: nil, headers: nil, params: nil)
              end

              sig do
                override.returns(
                  {
                    method_:
                      Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Webhook::Method::OrSymbol,
                    url: String,
                    body: T.nilable(T::Hash[Symbol, T.anything]),
                    headers: T.nilable(T::Hash[Symbol, T.anything]),
                    params: T.nilable(T::Hash[Symbol, T.anything])
                  }
                )
              end
              def to_hash
              end

              module Method
                extend Courier::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Webhook::Method
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                GET =
                  T.let(
                    :GET,
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Webhook::Method::TaggedSymbol
                  )
                POST =
                  T.let(
                    :POST,
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Webhook::Method::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Webhook::Method::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end
          end

          class AutomationInvokeStep < Courier::Models::Automations::AutomationStep
            OrHash =
              T.type_alias do
                T.any(
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationInvokeStep,
                  Courier::Internal::AnyHash
                )
              end

            sig do
              returns(
                Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationInvokeStep::Action::OrSymbol
              )
            end
            attr_accessor :action

            sig { returns(String) }
            attr_accessor :template

            sig do
              params(
                action:
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationInvokeStep::Action::OrSymbol,
                template: String
              ).returns(T.attached_class)
            end
            def self.new(action:, template:)
            end

            sig do
              override.returns(
                {
                  action:
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationInvokeStep::Action::OrSymbol,
                  template: String
                }
              )
            end
            def to_hash
            end

            module Action
              extend Courier::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationInvokeStep::Action
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              INVOKE =
                T.let(
                  :invoke,
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationInvokeStep::Action::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationInvokeStep::Action::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class AutomationSendStep < Courier::Models::Automations::AutomationStep
            OrHash =
              T.type_alias do
                T.any(
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationSendStep,
                  Courier::Internal::AnyHash
                )
              end

            sig do
              returns(
                Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationSendStep::Action::OrSymbol
              )
            end
            attr_accessor :action

            sig { returns(T.nilable(String)) }
            attr_accessor :brand

            sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
            attr_accessor :data

            sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
            attr_accessor :override

            sig { returns(T.nilable(T.anything)) }
            attr_reader :profile

            sig { params(profile: T.anything).void }
            attr_writer :profile

            sig { returns(T.nilable(String)) }
            attr_accessor :recipient

            sig { returns(T.nilable(String)) }
            attr_accessor :template

            sig do
              params(
                action:
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationSendStep::Action::OrSymbol,
                brand: T.nilable(String),
                data: T.nilable(T::Hash[Symbol, T.anything]),
                override: T.nilable(T::Hash[Symbol, T.anything]),
                profile: T.anything,
                recipient: T.nilable(String),
                template: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(
              action:,
              brand: nil,
              data: nil,
              override: nil,
              profile: nil,
              recipient: nil,
              template: nil
            )
            end

            sig do
              override.returns(
                {
                  action:
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationSendStep::Action::OrSymbol,
                  brand: T.nilable(String),
                  data: T.nilable(T::Hash[Symbol, T.anything]),
                  override: T.nilable(T::Hash[Symbol, T.anything]),
                  profile: T.anything,
                  recipient: T.nilable(String),
                  template: T.nilable(String)
                }
              )
            end
            def to_hash
            end

            module Action
              extend Courier::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationSendStep::Action
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              SEND =
                T.let(
                  :send,
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationSendStep::Action::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationSendStep::Action::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class AutomationV2SendStep < Courier::Models::Automations::AutomationStep
            OrHash =
              T.type_alias do
                T.any(
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationV2SendStep,
                  Courier::Internal::AnyHash
                )
              end

            sig do
              returns(
                Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationV2SendStep::Action::OrSymbol
              )
            end
            attr_accessor :action

            # Describes the content of the message in a way that will work for email, push,
            # chat, or any channel.
            sig do
              returns(
                T.any(
                  Courier::Message::ContentMessage,
                  Courier::Message::TemplateMessage
                )
              )
            end
            attr_accessor :message

            sig do
              params(
                action:
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationV2SendStep::Action::OrSymbol,
                message:
                  T.any(
                    Courier::Message::ContentMessage::OrHash,
                    Courier::Message::TemplateMessage::OrHash
                  )
              ).returns(T.attached_class)
            end
            def self.new(
              action:,
              # Describes the content of the message in a way that will work for email, push,
              # chat, or any channel.
              message:
            )
            end

            sig do
              override.returns(
                {
                  action:
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationV2SendStep::Action::OrSymbol,
                  message:
                    T.any(
                      Courier::Message::ContentMessage,
                      Courier::Message::TemplateMessage
                    )
                }
              )
            end
            def to_hash
            end

            module Action
              extend Courier::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationV2SendStep::Action
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              SEND =
                T.let(
                  :send,
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationV2SendStep::Action::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationV2SendStep::Action::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class AutomationSendListStep < Courier::Models::Automations::AutomationStep
            OrHash =
              T.type_alias do
                T.any(
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationSendListStep,
                  Courier::Internal::AnyHash
                )
              end

            sig do
              returns(
                Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationSendListStep::Action::OrSymbol
              )
            end
            attr_accessor :action

            sig { returns(String) }
            attr_accessor :list

            sig { returns(T.nilable(String)) }
            attr_accessor :brand

            sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
            attr_accessor :data

            sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
            attr_accessor :override

            sig { returns(T.nilable(String)) }
            attr_accessor :template

            sig do
              params(
                action:
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationSendListStep::Action::OrSymbol,
                list: String,
                brand: T.nilable(String),
                data: T.nilable(T::Hash[Symbol, T.anything]),
                override: T.nilable(T::Hash[Symbol, T.anything]),
                template: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(
              action:,
              list:,
              brand: nil,
              data: nil,
              override: nil,
              template: nil
            )
            end

            sig do
              override.returns(
                {
                  action:
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationSendListStep::Action::OrSymbol,
                  list: String,
                  brand: T.nilable(String),
                  data: T.nilable(T::Hash[Symbol, T.anything]),
                  override: T.nilable(T::Hash[Symbol, T.anything]),
                  template: T.nilable(String)
                }
              )
            end
            def to_hash
            end

            module Action
              extend Courier::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationSendListStep::Action
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              SEND_LIST =
                T.let(
                  :"send-list",
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationSendListStep::Action::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationSendListStep::Action::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class AutomationUpdateProfileStep < Courier::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationUpdateProfileStep,
                  Courier::Internal::AnyHash
                )
              end

            sig do
              returns(
                Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationUpdateProfileStep::Action::OrSymbol
              )
            end
            attr_accessor :action

            sig { returns(Courier::Automations::MergeAlgorithm::OrSymbol) }
            attr_accessor :merge

            sig { returns(T.anything) }
            attr_accessor :profile

            sig { returns(String) }
            attr_accessor :recipient_id

            sig do
              params(
                action:
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationUpdateProfileStep::Action::OrSymbol,
                merge: Courier::Automations::MergeAlgorithm::OrSymbol,
                profile: T.anything,
                recipient_id: String
              ).returns(T.attached_class)
            end
            def self.new(action:, merge:, profile:, recipient_id:)
            end

            sig do
              override.returns(
                {
                  action:
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationUpdateProfileStep::Action::OrSymbol,
                  merge: Courier::Automations::MergeAlgorithm::OrSymbol,
                  profile: T.anything,
                  recipient_id: String
                }
              )
            end
            def to_hash
            end

            module Action
              extend Courier::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationUpdateProfileStep::Action
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              UPDATE_PROFILE =
                T.let(
                  :"update-profile",
                  Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationUpdateProfileStep::Action::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Courier::AutomationInvokeAdHocParams::Automation::Step::AutomationUpdateProfileStep::Action::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          sig do
            override.returns(
              T::Array[
                Courier::AutomationInvokeAdHocParams::Automation::Step::Variants
              ]
            )
          end
          def self.variants
          end
        end
      end
    end
  end
end
