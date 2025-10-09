# typed: strong

module Trycourier
  module Models
    module Users
      class PreferenceRetrieveResponse < Trycourier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Trycourier::Models::Users::PreferenceRetrieveResponse,
              Trycourier::Internal::AnyHash
            )
          end

        # The Preferences associated with the user_id.
        sig { returns(T::Array[Trycourier::TopicPreference]) }
        attr_accessor :items

        # Deprecated - Paging not implemented on this endpoint
        sig { returns(Trycourier::Paging) }
        attr_reader :paging

        sig { params(paging: Trycourier::Paging::OrHash).void }
        attr_writer :paging

        sig do
          params(
            items: T::Array[Trycourier::TopicPreference::OrHash],
            paging: Trycourier::Paging::OrHash
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
              items: T::Array[Trycourier::TopicPreference],
              paging: Trycourier::Paging
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
