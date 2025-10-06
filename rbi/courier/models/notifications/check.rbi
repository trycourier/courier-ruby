# typed: strong

module Courier
  module Models
    module Notifications
      class Check < Courier::Models::Notifications::BaseCheck
        OrHash =
          T.type_alias do
            T.any(Courier::Notifications::Check, Courier::Internal::AnyHash)
          end

        sig { returns(Integer) }
        attr_accessor :updated

        sig { params(updated: Integer).returns(T.attached_class) }
        def self.new(updated:)
        end

        sig { override.returns({ updated: Integer }) }
        def to_hash
        end
      end
    end
  end
end
