# typed: strong

module Courier
  module Models
    module Notifications
      class CheckUpdateParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Courier::Notifications::CheckUpdateParams,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(T::Array[Courier::BaseCheck]) }
        attr_accessor :checks

        sig do
          params(
            id: String,
            checks: T::Array[Courier::BaseCheck::OrHash],
            request_options: Courier::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(id:, checks:, request_options: {})
        end

        sig do
          override.returns(
            {
              id: String,
              checks: T::Array[Courier::BaseCheck],
              request_options: Courier::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
