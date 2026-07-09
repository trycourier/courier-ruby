# typed: strong

module Courier
  module Models
    module Users
      class PreferenceBulkReplaceResponse < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::Models::Users::PreferenceBulkReplaceResponse,
              Courier::Internal::AnyHash
            )
          end

        # The ids of the overrides that were reset to their topic default.
        sig { returns(T::Array[String]) }
        attr_accessor :deleted

        # The complete resulting set of topic overrides for the user.
        sig { returns(T::Array[Courier::Users::BulkPreferenceTopic]) }
        attr_accessor :items

        sig do
          params(
            deleted: T::Array[String],
            items: T::Array[Courier::Users::BulkPreferenceTopic::OrHash]
          ).returns(T.attached_class)
        end
        def self.new(
          # The ids of the overrides that were reset to their topic default.
          deleted:,
          # The complete resulting set of topic overrides for the user.
          items:
        )
        end

        sig do
          override.returns(
            {
              deleted: T::Array[String],
              items: T::Array[Courier::Users::BulkPreferenceTopic]
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
