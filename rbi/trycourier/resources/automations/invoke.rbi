# typed: strong

module Trycourier
  module Resources
    class Automations
      class Invoke
        # Invoke an ad hoc automation run. This endpoint accepts a JSON payload with a
        # series of automation steps. For information about what steps are available,
        # checkout the ad hoc automation guide
        # [here](https://www.courier.com/docs/automations/steps/).
        sig do
          params(
            automation:
              Trycourier::Automations::InvokeInvokeAdHocParams::Automation::OrHash,
            brand: T.nilable(String),
            data: T.nilable(T::Hash[Symbol, T.anything]),
            profile: T.nilable(T::Hash[Symbol, T.anything]),
            recipient: T.nilable(String),
            template: T.nilable(String),
            request_options: Trycourier::RequestOptions::OrHash
          ).returns(Trycourier::AutomationInvokeResponse)
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

        # Invoke an automation run from an automation template.
        sig do
          params(
            template_id: String,
            recipient: T.nilable(String),
            brand: T.nilable(String),
            data: T.nilable(T::Hash[Symbol, T.anything]),
            profile: T.nilable(T::Hash[Symbol, T.anything]),
            template: T.nilable(String),
            request_options: Trycourier::RequestOptions::OrHash
          ).returns(Trycourier::AutomationInvokeResponse)
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
        sig { params(client: Trycourier::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
