# typed: strong

module Courier
  module Models
    module Automations
      class InvokeInvokeByTemplateParams < Courier::Models::Automations::AutomationInvokeParams
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Courier::Automations::InvokeInvokeByTemplateParams,
              Courier::Internal::AnyHash
            )
          end

        sig do
          params(request_options: Courier::RequestOptions::OrHash).returns(
            T.attached_class
          )
        end
        def self.new(request_options: {})
        end

        sig { override.returns({ request_options: Courier::RequestOptions }) }
        def to_hash
        end
      end
    end
  end
end
