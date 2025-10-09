# typed: strong

module Trycourier
  module Models
    module Notifications
      class CheckUpdateResponse < Trycourier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Trycourier::Models::Notifications::CheckUpdateResponse,
              Trycourier::Internal::AnyHash
            )
          end

        sig { returns(T::Array[Trycourier::Check]) }
        attr_accessor :checks

        sig do
          params(checks: T::Array[Trycourier::Check::OrHash]).returns(
            T.attached_class
          )
        end
        def self.new(checks:)
        end

        sig { override.returns({ checks: T::Array[Trycourier::Check] }) }
        def to_hash
        end
      end
    end
  end
end
