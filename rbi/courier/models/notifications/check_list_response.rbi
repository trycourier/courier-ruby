# typed: strong

module Courier
  module Models
    module Notifications
      class CheckListResponse < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::Models::Notifications::CheckListResponse,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(T::Array[Courier::Check]) }
        attr_accessor :checks

        sig do
          params(checks: T::Array[Courier::Check::OrHash]).returns(
            T.attached_class
          )
        end
        def self.new(checks:)
        end

        sig { override.returns({ checks: T::Array[Courier::Check] }) }
        def to_hash
        end
      end
    end
  end
end
