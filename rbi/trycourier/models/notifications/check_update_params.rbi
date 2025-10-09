# typed: strong

module Trycourier
  module Models
    module Notifications
      class CheckUpdateParams < Trycourier::Internal::Type::BaseModel
        extend Trycourier::Internal::Type::RequestParameters::Converter
        include Trycourier::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Trycourier::Notifications::CheckUpdateParams,
              Trycourier::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(T::Array[Trycourier::BaseCheck]) }
        attr_accessor :checks

        sig do
          params(
            id: String,
            checks: T::Array[Trycourier::BaseCheck::OrHash],
            request_options: Trycourier::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(id:, checks:, request_options: {})
        end

        sig do
          override.returns(
            {
              id: String,
              checks: T::Array[Trycourier::BaseCheck],
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
