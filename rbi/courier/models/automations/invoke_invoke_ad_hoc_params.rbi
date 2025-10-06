# typed: strong

module Courier
  module Models
    module Automations
      class InvokeInvokeAdHocParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Courier::Automations::InvokeInvokeAdHocParams,
              Courier::Internal::AnyHash
            )
          end

        sig do
          returns(Courier::Automations::InvokeInvokeAdHocParams::Automation)
        end
        attr_reader :automation

        sig do
          params(
            automation:
              Courier::Automations::InvokeInvokeAdHocParams::Automation::OrHash
          ).void
        end
        attr_writer :automation

        sig { returns(T.nilable(String)) }
        attr_accessor :brand

        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_accessor :data

        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_accessor :profile

        sig { returns(T.nilable(String)) }
        attr_accessor :recipient

        sig { returns(T.nilable(String)) }
        attr_accessor :template

        sig do
          params(
            automation:
              Courier::Automations::InvokeInvokeAdHocParams::Automation::OrHash,
            brand: T.nilable(String),
            data: T.nilable(T::Hash[Symbol, T.anything]),
            profile: T.nilable(T::Hash[Symbol, T.anything]),
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
              automation:
                Courier::Automations::InvokeInvokeAdHocParams::Automation,
              brand: T.nilable(String),
              data: T.nilable(T::Hash[Symbol, T.anything]),
              profile: T.nilable(T::Hash[Symbol, T.anything]),
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
                Courier::Automations::InvokeInvokeAdHocParams::Automation,
                Courier::Internal::AnyHash
              )
            end

          sig do
            returns(
              T::Array[
                T.any(
                  Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationDelayStep,
                  Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationSendStep,
                  Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationSendListStep,
                  Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationUpdateProfileStep,
                  Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationCancelStep,
                  Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep,
                  Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationInvokeStep
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
                    Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationDelayStep::OrHash,
                    Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationSendStep::OrHash,
                    Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationSendListStep::OrHash,
                    Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationUpdateProfileStep::OrHash,
                    Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationCancelStep::OrHash,
                    Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::OrHash,
                    Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationInvokeStep::OrHash
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
                      Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationDelayStep,
                      Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationSendStep,
                      Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationSendListStep,
                      Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationUpdateProfileStep,
                      Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationCancelStep,
                      Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep,
                      Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationInvokeStep
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
                  Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationDelayStep,
                  Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationSendStep,
                  Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationSendListStep,
                  Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationUpdateProfileStep,
                  Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationCancelStep,
                  Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep,
                  Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationInvokeStep
                )
              end

            class AutomationDelayStep < Courier::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationDelayStep,
                    Courier::Internal::AnyHash
                  )
                end

              sig do
                returns(
                  Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationDelayStep::Action::OrSymbol
                )
              end
              attr_accessor :action

              sig { returns(T.nilable(String)) }
              attr_accessor :duration

              sig { returns(T.nilable(String)) }
              attr_accessor :until_

              sig do
                params(
                  action:
                    Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationDelayStep::Action::OrSymbol,
                  duration: T.nilable(String),
                  until_: T.nilable(String)
                ).returns(T.attached_class)
              end
              def self.new(action:, duration: nil, until_: nil)
              end

              sig do
                override.returns(
                  {
                    action:
                      Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationDelayStep::Action::OrSymbol,
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
                      Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationDelayStep::Action
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                DELAY =
                  T.let(
                    :delay,
                    Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationDelayStep::Action::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationDelayStep::Action::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            class AutomationSendStep < Courier::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationSendStep,
                    Courier::Internal::AnyHash
                  )
                end

              sig do
                returns(
                  Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationSendStep::Action::OrSymbol
                )
              end
              attr_accessor :action

              sig { returns(T.nilable(String)) }
              attr_accessor :brand

              sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
              attr_accessor :data

              sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
              attr_accessor :profile

              sig { returns(T.nilable(String)) }
              attr_accessor :recipient

              sig { returns(T.nilable(String)) }
              attr_accessor :template

              sig do
                params(
                  action:
                    Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationSendStep::Action::OrSymbol,
                  brand: T.nilable(String),
                  data: T.nilable(T::Hash[Symbol, T.anything]),
                  profile: T.nilable(T::Hash[Symbol, T.anything]),
                  recipient: T.nilable(String),
                  template: T.nilable(String)
                ).returns(T.attached_class)
              end
              def self.new(
                action:,
                brand: nil,
                data: nil,
                profile: nil,
                recipient: nil,
                template: nil
              )
              end

              sig do
                override.returns(
                  {
                    action:
                      Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationSendStep::Action::OrSymbol,
                    brand: T.nilable(String),
                    data: T.nilable(T::Hash[Symbol, T.anything]),
                    profile: T.nilable(T::Hash[Symbol, T.anything]),
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
                      Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationSendStep::Action
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                SEND =
                  T.let(
                    :send,
                    Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationSendStep::Action::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationSendStep::Action::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            class AutomationSendListStep < Courier::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationSendListStep,
                    Courier::Internal::AnyHash
                  )
                end

              sig do
                returns(
                  Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationSendListStep::Action::OrSymbol
                )
              end
              attr_accessor :action

              sig { returns(String) }
              attr_accessor :list

              sig { returns(T.nilable(String)) }
              attr_accessor :brand

              sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
              attr_accessor :data

              sig do
                params(
                  action:
                    Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationSendListStep::Action::OrSymbol,
                  list: String,
                  brand: T.nilable(String),
                  data: T.nilable(T::Hash[Symbol, T.anything])
                ).returns(T.attached_class)
              end
              def self.new(action:, list:, brand: nil, data: nil)
              end

              sig do
                override.returns(
                  {
                    action:
                      Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationSendListStep::Action::OrSymbol,
                    list: String,
                    brand: T.nilable(String),
                    data: T.nilable(T::Hash[Symbol, T.anything])
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
                      Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationSendListStep::Action
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                SEND_LIST =
                  T.let(
                    :"send-list",
                    Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationSendListStep::Action::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationSendListStep::Action::TaggedSymbol
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
                    Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationUpdateProfileStep,
                    Courier::Internal::AnyHash
                  )
                end

              sig do
                returns(
                  Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationUpdateProfileStep::Action::OrSymbol
                )
              end
              attr_accessor :action

              sig { returns(T::Hash[Symbol, T.anything]) }
              attr_accessor :profile

              sig do
                returns(
                  T.nilable(
                    Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationUpdateProfileStep::Merge::OrSymbol
                  )
                )
              end
              attr_accessor :merge

              sig { returns(T.nilable(String)) }
              attr_accessor :recipient_id

              sig do
                params(
                  action:
                    Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationUpdateProfileStep::Action::OrSymbol,
                  profile: T::Hash[Symbol, T.anything],
                  merge:
                    T.nilable(
                      Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationUpdateProfileStep::Merge::OrSymbol
                    ),
                  recipient_id: T.nilable(String)
                ).returns(T.attached_class)
              end
              def self.new(action:, profile:, merge: nil, recipient_id: nil)
              end

              sig do
                override.returns(
                  {
                    action:
                      Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationUpdateProfileStep::Action::OrSymbol,
                    profile: T::Hash[Symbol, T.anything],
                    merge:
                      T.nilable(
                        Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationUpdateProfileStep::Merge::OrSymbol
                      ),
                    recipient_id: T.nilable(String)
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
                      Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationUpdateProfileStep::Action
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                UPDATE_PROFILE =
                  T.let(
                    :"update-profile",
                    Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationUpdateProfileStep::Action::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationUpdateProfileStep::Action::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              module Merge
                extend Courier::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationUpdateProfileStep::Merge
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                NONE =
                  T.let(
                    :none,
                    Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationUpdateProfileStep::Merge::TaggedSymbol
                  )
                OVERWRITE =
                  T.let(
                    :overwrite,
                    Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationUpdateProfileStep::Merge::TaggedSymbol
                  )
                SOFT_MERGE =
                  T.let(
                    :"soft-merge",
                    Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationUpdateProfileStep::Merge::TaggedSymbol
                  )
                REPLACE =
                  T.let(
                    :replace,
                    Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationUpdateProfileStep::Merge::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationUpdateProfileStep::Merge::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            class AutomationCancelStep < Courier::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationCancelStep,
                    Courier::Internal::AnyHash
                  )
                end

              sig do
                returns(
                  Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationCancelStep::Action::OrSymbol
                )
              end
              attr_accessor :action

              sig { returns(String) }
              attr_accessor :cancelation_token

              sig do
                params(
                  action:
                    Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationCancelStep::Action::OrSymbol,
                  cancelation_token: String
                ).returns(T.attached_class)
              end
              def self.new(action:, cancelation_token:)
              end

              sig do
                override.returns(
                  {
                    action:
                      Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationCancelStep::Action::OrSymbol,
                    cancelation_token: String
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
                      Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationCancelStep::Action
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                CANCEL =
                  T.let(
                    :cancel,
                    Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationCancelStep::Action::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationCancelStep::Action::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            class AutomationFetchDataStep < Courier::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep,
                    Courier::Internal::AnyHash
                  )
                end

              sig do
                returns(
                  Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Action::OrSymbol
                )
              end
              attr_accessor :action

              sig do
                returns(
                  Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Webhook
                )
              end
              attr_reader :webhook

              sig do
                params(
                  webhook:
                    Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Webhook::OrHash
                ).void
              end
              attr_writer :webhook

              sig do
                returns(
                  T.nilable(
                    Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::MergeStrategy::OrSymbol
                  )
                )
              end
              attr_accessor :merge_strategy

              sig do
                params(
                  action:
                    Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Action::OrSymbol,
                  webhook:
                    Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Webhook::OrHash,
                  merge_strategy:
                    T.nilable(
                      Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::MergeStrategy::OrSymbol
                    )
                ).returns(T.attached_class)
              end
              def self.new(action:, webhook:, merge_strategy: nil)
              end

              sig do
                override.returns(
                  {
                    action:
                      Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Action::OrSymbol,
                    webhook:
                      Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Webhook,
                    merge_strategy:
                      T.nilable(
                        Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::MergeStrategy::OrSymbol
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
                      Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Action
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                FETCH_DATA =
                  T.let(
                    :"fetch-data",
                    Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Action::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Action::TaggedSymbol
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
                      Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Webhook,
                      Courier::Internal::AnyHash
                    )
                  end

                sig do
                  returns(
                    Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Webhook::Method::OrSymbol
                  )
                end
                attr_accessor :method_

                sig { returns(String) }
                attr_accessor :url

                sig { returns(T.nilable(String)) }
                attr_accessor :body

                sig { returns(T.nilable(T::Hash[Symbol, String])) }
                attr_accessor :headers

                sig do
                  params(
                    method_:
                      Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Webhook::Method::OrSymbol,
                    url: String,
                    body: T.nilable(String),
                    headers: T.nilable(T::Hash[Symbol, String])
                  ).returns(T.attached_class)
                end
                def self.new(method_:, url:, body: nil, headers: nil)
                end

                sig do
                  override.returns(
                    {
                      method_:
                        Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Webhook::Method::OrSymbol,
                      url: String,
                      body: T.nilable(String),
                      headers: T.nilable(T::Hash[Symbol, String])
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
                        Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Webhook::Method
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  GET =
                    T.let(
                      :GET,
                      Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Webhook::Method::TaggedSymbol
                    )
                  POST =
                    T.let(
                      :POST,
                      Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Webhook::Method::TaggedSymbol
                    )
                  PUT =
                    T.let(
                      :PUT,
                      Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Webhook::Method::TaggedSymbol
                    )
                  PATCH =
                    T.let(
                      :PATCH,
                      Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Webhook::Method::TaggedSymbol
                    )
                  DELETE =
                    T.let(
                      :DELETE,
                      Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Webhook::Method::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Webhook::Method::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end
              end

              module MergeStrategy
                extend Courier::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::MergeStrategy
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                REPLACE =
                  T.let(
                    :replace,
                    Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::MergeStrategy::TaggedSymbol
                  )
                OVERWRITE =
                  T.let(
                    :overwrite,
                    Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::MergeStrategy::TaggedSymbol
                  )
                SOFT_MERGE =
                  T.let(
                    :"soft-merge",
                    Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::MergeStrategy::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::MergeStrategy::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            class AutomationInvokeStep < Courier::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationInvokeStep,
                    Courier::Internal::AnyHash
                  )
                end

              sig do
                returns(
                  Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationInvokeStep::Action::OrSymbol
                )
              end
              attr_accessor :action

              sig { returns(String) }
              attr_accessor :template

              sig do
                params(
                  action:
                    Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationInvokeStep::Action::OrSymbol,
                  template: String
                ).returns(T.attached_class)
              end
              def self.new(action:, template:)
              end

              sig do
                override.returns(
                  {
                    action:
                      Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationInvokeStep::Action::OrSymbol,
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
                      Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationInvokeStep::Action
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                INVOKE =
                  T.let(
                    :invoke,
                    Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationInvokeStep::Action::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationInvokeStep::Action::TaggedSymbol
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
                  Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::Variants
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
end
