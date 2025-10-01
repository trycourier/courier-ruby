# typed: strong

module Courier
  module Models
    module Users
      class PreferenceRetrieveResponse < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::Models::Users::PreferenceRetrieveResponse,
              Courier::Internal::AnyHash
            )
          end

        # The Preferences associated with the user_id.
        sig { returns(T::Array[Courier::Users::TopicPreference]) }
        attr_accessor :items

        # Deprecated - Paging not implemented on this endpoint
        sig { returns(Courier::Paging) }
        attr_reader :paging

        sig { params(paging: Courier::Paging::OrHash).void }
        attr_writer :paging

        sig do
          params(
            items: T::Array[Courier::Users::TopicPreference::OrHash],
            paging: Courier::Paging::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The Preferences associated with the user_id.
          items:,
          # Deprecated - Paging not implemented on this endpoint
          paging:
        )
        end

        sig do
          override.returns(
            {
              items: T::Array[Courier::Users::TopicPreference],
              paging: Courier::Paging
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
