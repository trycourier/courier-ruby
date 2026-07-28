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
            idempotency_key: String,
            x_idempotency_expiration: String,
            request_options: Courier::RequestOptions::OrHash
          ).returns(Courier::AutomationInvokeResponse)
        end
        def invoke_ad_hoc(
          # Body param
          automation:,
          # Body param
          brand: nil,
          # Body param
          data: nil,
          # Body param
          profile: nil,
          # Body param
          recipient: nil,
          # Body param
          template: nil,
          # Header param: A unique key that makes this request idempotent. If Courier
          # receives another request with the same `Idempotency-Key`, it returns the stored
          # response from the first request without performing the operation again
          # (including the original status code and any error). Use it to safely retry
          # `POST` requests after network failures without risking duplicate sends. The key
          # is scoped to this endpoint.
          idempotency_key: nil,
          # Header param: How long the idempotency key remains valid, as a Unix epoch
          # timestamp in seconds or an ISO 8601 date string. Only applies when
          # `Idempotency-Key` is provided. If omitted, the key is retained for 25 hours; the
          # maximum is 1 year.
          x_idempotency_expiration: nil,
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
            idempotency_key: String,
            x_idempotency_expiration: String,
            request_options: Courier::RequestOptions::OrHash
          ).returns(Courier::AutomationInvokeResponse)
        end
        def invoke_by_template(
          # Path param: A unique identifier representing the automation template to be
          # invoked. This could be the Automation Template ID or the Automation Template
          # Alias.
          template_id,
          # Body param
          recipient:,
          # Body param
          brand: nil,
          # Body param
          data: nil,
          # Body param
          profile: nil,
          # Body param
          template: nil,
          # Header param: A unique key that makes this request idempotent. If Courier
          # receives another request with the same `Idempotency-Key`, it returns the stored
          # response from the first request without performing the operation again
          # (including the original status code and any error). Use it to safely retry
          # `POST` requests after network failures without risking duplicate sends. The key
          # is scoped to this endpoint.
          idempotency_key: nil,
          # Header param: How long the idempotency key remains valid, as a Unix epoch
          # timestamp in seconds or an ISO 8601 date string. Only applies when
          # `Idempotency-Key` is provided. If omitted, the key is retained for 25 hours; the
          # maximum is 1 year.
          x_idempotency_expiration: nil,
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
