# typed: strong

module Courier
  module Models
    module Notifications
      class CheckUpdateResponse < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::Models::Notifications::CheckUpdateResponse,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(T::Array[Courier::Notifications::Check]) }
        attr_accessor :checks

        sig do
          params(
            checks: T::Array[Courier::Notifications::Check::OrHash]
          ).returns(T.attached_class)
        end
        def self.new(checks:)
        end

        sig do
          override.returns({ checks: T::Array[Courier::Notifications::Check] })
        end
        def to_hash
        end
      end
    end
  end
end
