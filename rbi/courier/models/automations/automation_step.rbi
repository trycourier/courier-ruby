# typed: strong

module Courier
  module Models
    AutomationStep = Automations::AutomationStep

    module Automations
      class AutomationStep < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::Automations::AutomationStep,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_accessor :if_

        sig { returns(T.nilable(String)) }
        attr_accessor :ref

        sig do
          params(if_: T.nilable(String), ref: T.nilable(String)).returns(
            T.attached_class
          )
        end
        def self.new(if_: nil, ref: nil)
        end

        sig do
          override.returns({ if_: T.nilable(String), ref: T.nilable(String) })
        end
        def to_hash
        end
      end
    end
  end
end
