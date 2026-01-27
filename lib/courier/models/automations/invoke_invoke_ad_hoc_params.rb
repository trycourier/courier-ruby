# frozen_string_literal: true

module Courier
  module Models
    module Automations
      # @see Courier::Resources::Automations::Invoke#invoke_ad_hoc
      class InvokeInvokeAdHocParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        # @!attribute automation
        #
        #   @return [Courier::Models::Automations::InvokeInvokeAdHocParams::Automation]
        required :automation, -> { Courier::Automations::InvokeInvokeAdHocParams::Automation }

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
        #   @return [Hash{Symbol=>Object}, nil]
        optional :profile, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown], nil?: true

        # @!attribute recipient
        #
        #   @return [String, nil]
        optional :recipient, String, nil?: true

        # @!attribute template
        #
        #   @return [String, nil]
        optional :template, String, nil?: true

        # @!method initialize(automation:, brand: nil, data: nil, profile: nil, recipient: nil, template: nil, request_options: {})
        #   @param automation [Courier::Models::Automations::InvokeInvokeAdHocParams::Automation]
        #   @param brand [String, nil]
        #   @param data [Hash{Symbol=>Object}, nil]
        #   @param profile [Hash{Symbol=>Object}, nil]
        #   @param recipient [String, nil]
        #   @param template [String, nil]
        #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]

        class Automation < Courier::Internal::Type::BaseModel
          # @!attribute steps
          #
          #   @return [Array<Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationDelayStep, Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationSendStep, Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationSendListStep, Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationUpdateProfileStep, Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationCancelStep, Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep, Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationInvokeStep>]
          required :steps,
                   -> { Courier::Internal::Type::ArrayOf[union: Courier::Automations::InvokeInvokeAdHocParams::Automation::Step] }

          # @!attribute cancelation_token
          #
          #   @return [String, nil]
          optional :cancelation_token, String, nil?: true

          # @!method initialize(steps:, cancelation_token: nil)
          #   @param steps [Array<Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationDelayStep, Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationSendStep, Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationSendListStep, Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationUpdateProfileStep, Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationCancelStep, Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep, Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationInvokeStep>]
          #   @param cancelation_token [String, nil]

          module Step
            extend Courier::Internal::Type::Union

            variant -> { Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationDelayStep }

            variant -> { Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationSendStep }

            variant -> { Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationSendListStep }

            variant -> { Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationUpdateProfileStep }

            variant -> { Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationCancelStep }

            variant -> { Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep }

            variant -> { Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationInvokeStep }

            class AutomationDelayStep < Courier::Internal::Type::BaseModel
              # @!attribute action
              #
              #   @return [Symbol, Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationDelayStep::Action]
              required :action,
                       enum: -> { Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationDelayStep::Action }

              # @!attribute duration
              #
              #   @return [String, nil]
              optional :duration, String, nil?: true

              # @!attribute until_
              #
              #   @return [String, nil]
              optional :until_, String, api_name: :until, nil?: true

              # @!method initialize(action:, duration: nil, until_: nil)
              #   @param action [Symbol, Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationDelayStep::Action]
              #   @param duration [String, nil]
              #   @param until_ [String, nil]

              # @see Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationDelayStep#action
              module Action
                extend Courier::Internal::Type::Enum

                DELAY = :delay

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            class AutomationSendStep < Courier::Internal::Type::BaseModel
              # @!attribute action
              #
              #   @return [Symbol, Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationSendStep::Action]
              required :action,
                       enum: -> { Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationSendStep::Action }

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
              #   @return [Hash{Symbol=>Object}, nil]
              optional :profile, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown], nil?: true

              # @!attribute recipient
              #
              #   @return [String, nil]
              optional :recipient, String, nil?: true

              # @!attribute template
              #
              #   @return [String, nil]
              optional :template, String, nil?: true

              # @!method initialize(action:, brand: nil, data: nil, profile: nil, recipient: nil, template: nil)
              #   @param action [Symbol, Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationSendStep::Action]
              #   @param brand [String, nil]
              #   @param data [Hash{Symbol=>Object}, nil]
              #   @param profile [Hash{Symbol=>Object}, nil]
              #   @param recipient [String, nil]
              #   @param template [String, nil]

              # @see Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationSendStep#action
              module Action
                extend Courier::Internal::Type::Enum

                SEND = :send

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            class AutomationSendListStep < Courier::Internal::Type::BaseModel
              # @!attribute action
              #
              #   @return [Symbol, Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationSendListStep::Action]
              required :action,
                       enum: -> { Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationSendListStep::Action }

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

              # @!method initialize(action:, list:, brand: nil, data: nil)
              #   @param action [Symbol, Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationSendListStep::Action]
              #   @param list [String]
              #   @param brand [String, nil]
              #   @param data [Hash{Symbol=>Object}, nil]

              # @see Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationSendListStep#action
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
              #   @return [Symbol, Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationUpdateProfileStep::Action]
              required :action,
                       enum: -> { Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationUpdateProfileStep::Action }

              # @!attribute profile
              #
              #   @return [Hash{Symbol=>Object}]
              required :profile, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown]

              # @!attribute merge
              #
              #   @return [Symbol, Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationUpdateProfileStep::Merge, nil]
              optional :merge,
                       enum: -> {
                         Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationUpdateProfileStep::Merge
                       },
                       nil?: true

              # @!attribute recipient_id
              #
              #   @return [String, nil]
              optional :recipient_id, String, nil?: true

              # @!method initialize(action:, profile:, merge: nil, recipient_id: nil)
              #   @param action [Symbol, Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationUpdateProfileStep::Action]
              #   @param profile [Hash{Symbol=>Object}]
              #   @param merge [Symbol, Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationUpdateProfileStep::Merge, nil]
              #   @param recipient_id [String, nil]

              # @see Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationUpdateProfileStep#action
              module Action
                extend Courier::Internal::Type::Enum

                UPDATE_PROFILE = :"update-profile"

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @see Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationUpdateProfileStep#merge
              module Merge
                extend Courier::Internal::Type::Enum

                NONE = :none
                OVERWRITE = :overwrite
                SOFT_MERGE = :"soft-merge"
                REPLACE = :replace

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            class AutomationCancelStep < Courier::Internal::Type::BaseModel
              # @!attribute action
              #
              #   @return [Symbol, Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationCancelStep::Action]
              required :action,
                       enum: -> { Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationCancelStep::Action }

              # @!attribute cancelation_token
              #
              #   @return [String]
              required :cancelation_token, String

              # @!method initialize(action:, cancelation_token:)
              #   @param action [Symbol, Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationCancelStep::Action]
              #   @param cancelation_token [String]

              # @see Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationCancelStep#action
              module Action
                extend Courier::Internal::Type::Enum

                CANCEL = :cancel

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            class AutomationFetchDataStep < Courier::Internal::Type::BaseModel
              # @!attribute action
              #
              #   @return [Symbol, Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Action]
              required :action,
                       enum: -> { Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Action }

              # @!attribute webhook
              #
              #   @return [Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Webhook]
              required :webhook,
                       -> { Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Webhook }

              # @!attribute merge_strategy
              #
              #   @return [Symbol, Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::MergeStrategy, nil]
              optional :merge_strategy,
                       enum: -> {
                         Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::MergeStrategy
                       },
                       nil?: true

              # @!method initialize(action:, webhook:, merge_strategy: nil)
              #   @param action [Symbol, Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Action]
              #   @param webhook [Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Webhook]
              #   @param merge_strategy [Symbol, Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::MergeStrategy, nil]

              # @see Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep#action
              module Action
                extend Courier::Internal::Type::Enum

                FETCH_DATA = :"fetch-data"

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @see Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep#webhook
              class Webhook < Courier::Internal::Type::BaseModel
                # @!attribute method_
                #
                #   @return [Symbol, Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Webhook::Method]
                required :method_,
                         enum: -> {
                           Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Webhook::Method
                         },
                         api_name: :method

                # @!attribute url
                #
                #   @return [String]
                required :url, String

                # @!attribute body
                #
                #   @return [String, nil]
                optional :body, String, nil?: true

                # @!attribute headers
                #
                #   @return [Hash{Symbol=>String}, nil]
                optional :headers, Courier::Internal::Type::HashOf[String], nil?: true

                # @!method initialize(method_:, url:, body: nil, headers: nil)
                #   @param method_ [Symbol, Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Webhook::Method]
                #   @param url [String]
                #   @param body [String, nil]
                #   @param headers [Hash{Symbol=>String}, nil]

                # @see Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep::Webhook#method_
                module Method
                  extend Courier::Internal::Type::Enum

                  GET = :GET
                  POST = :POST
                  PUT = :PUT
                  PATCH = :PATCH
                  DELETE = :DELETE

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end
              end

              # @see Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep#merge_strategy
              module MergeStrategy
                extend Courier::Internal::Type::Enum

                REPLACE = :replace
                OVERWRITE = :overwrite
                SOFT_MERGE = :"soft-merge"

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            class AutomationInvokeStep < Courier::Internal::Type::BaseModel
              # @!attribute action
              #
              #   @return [Symbol, Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationInvokeStep::Action]
              required :action,
                       enum: -> { Courier::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationInvokeStep::Action }

              # @!attribute template
              #
              #   @return [String]
              required :template, String

              # @!method initialize(action:, template:)
              #   @param action [Symbol, Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationInvokeStep::Action]
              #   @param template [String]

              # @see Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationInvokeStep#action
              module Action
                extend Courier::Internal::Type::Enum

                INVOKE = :invoke

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # @!method self.variants
            #   @return [Array(Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationDelayStep, Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationSendStep, Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationSendListStep, Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationUpdateProfileStep, Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationCancelStep, Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationFetchDataStep, Courier::Models::Automations::InvokeInvokeAdHocParams::Automation::Step::AutomationInvokeStep)]
          end
        end
      end
    end
  end
end
