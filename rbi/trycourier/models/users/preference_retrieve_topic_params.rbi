# typed: strong

module Trycourier
  module Models
    module Users
      class PreferenceRetrieveTopicParams < Trycourier::Internal::Type::BaseModel
        extend Trycourier::Internal::Type::RequestParameters::Converter
        include Trycourier::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Trycourier::Users::PreferenceRetrieveTopicParams,
              Trycourier::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :user_id

        # Query the preferences of a user for this specific tenant context.
        sig { returns(T.nilable(String)) }
        attr_accessor :tenant_id

        sig do
          params(
            user_id: String,
            tenant_id: T.nilable(String),
            request_options: Trycourier::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          user_id:,
          # Query the preferences of a user for this specific tenant context.
          tenant_id: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              user_id: String,
              tenant_id: T.nilable(String),
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
