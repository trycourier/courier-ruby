# typed: strong

module Courier
  module Models
    AutomationInvokeResponse = Automations::AutomationInvokeResponse

    module Automations
      class AutomationInvokeResponse < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::Automations::AutomationInvokeResponse,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :run_id

        sig { params(run_id: String).returns(T.attached_class) }
        def self.new(run_id:)
        end

        sig { override.returns({ run_id: String }) }
        def to_hash
        end
      end
    end
  end
end
