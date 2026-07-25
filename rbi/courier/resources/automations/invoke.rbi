# typed: strong

module Courier
  module Resources
    class Automations
      class Invoke
        # Runs a series of automation steps supplied inline, without a saved template, and
        # returns a runId.
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
          ).returns(Courier::AutomationInvokeResponse)
        end
        def invoke_ad_hoc(
          automation:,
          brand: nil,
          data: nil,
          profile: nil,
          recipient: nil,
          template: nil,
          request_options: {}
        )
        end

        # Starts an automation run from a saved template for one recipient, with optional
        # data and profile, and returns a runId.
        sig do
          params(
            template_id: String,
            recipient: T.nilable(String),
            brand: T.nilable(String),
            data: T.nilable(T::Hash[Symbol, T.anything]),
            profile: T.nilable(T::Hash[Symbol, T.anything]),
            template: T.nilable(String),
            request_options: Courier::RequestOptions::OrHash
          ).returns(Courier::AutomationInvokeResponse)
        end
        def invoke_by_template(
          # A unique identifier representing the automation template to be invoked. This
          # could be the Automation Template ID or the Automation Template Alias.
          template_id,
          recipient:,
          brand: nil,
          data: nil,
          profile: nil,
          template: nil,
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
end
