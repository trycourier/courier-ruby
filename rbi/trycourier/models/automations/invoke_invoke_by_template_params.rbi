# typed: strong

module Trycourier
  module Models
    module Automations
      class InvokeInvokeByTemplateParams < Trycourier::Internal::Type::BaseModel
        extend Trycourier::Internal::Type::RequestParameters::Converter
        include Trycourier::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Trycourier::Automations::InvokeInvokeByTemplateParams,
              Trycourier::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_accessor :recipient

        sig { returns(T.nilable(String)) }
        attr_accessor :brand

        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_accessor :data

        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_accessor :profile

        sig { returns(T.nilable(String)) }
        attr_accessor :template

        sig do
          params(
            recipient: T.nilable(String),
            brand: T.nilable(String),
            data: T.nilable(T::Hash[Symbol, T.anything]),
            profile: T.nilable(T::Hash[Symbol, T.anything]),
            template: T.nilable(String),
            request_options: Trycourier::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          recipient:,
          brand: nil,
          data: nil,
          profile: nil,
          template: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              recipient: T.nilable(String),
              brand: T.nilable(String),
              data: T.nilable(T::Hash[Symbol, T.anything]),
              profile: T.nilable(T::Hash[Symbol, T.anything]),
              template: T.nilable(String),
              request_options: Trycourier::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
