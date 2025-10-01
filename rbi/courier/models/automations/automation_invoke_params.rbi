# typed: strong

module Courier
  module Models
    AutomationInvokeParams = Automations::AutomationInvokeParams

    module Automations
      class AutomationInvokeParams < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::Automations::AutomationInvokeParams,
              Courier::Internal::AnyHash
            )
          end

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
            brand: T.nilable(String),
            data: T.nilable(T::Hash[Symbol, T.anything]),
            profile: T.anything,
            recipient: T.nilable(String),
            template: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
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
              brand: T.nilable(String),
              data: T.nilable(T::Hash[Symbol, T.anything]),
              profile: T.anything,
              recipient: T.nilable(String),
              template: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
