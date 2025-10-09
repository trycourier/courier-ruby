# typed: strong

module Trycourier
  module Models
    class TenantUpdateParams < Trycourier::Internal::Type::BaseModel
      extend Trycourier::Internal::Type::RequestParameters::Converter
      include Trycourier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Trycourier::TenantUpdateParams, Trycourier::Internal::AnyHash)
        end

      # Name of the tenant.
      sig { returns(String) }
      attr_accessor :name

      # Brand to be used for the account when one is not specified by the send call.
      sig { returns(T.nilable(String)) }
      attr_accessor :brand_id

      # Defines the preferences used for the tenant when the user hasn't specified their
      # own.
      sig { returns(T.nilable(Trycourier::DefaultPreferences)) }
      attr_reader :default_preferences

      sig do
        params(
          default_preferences: T.nilable(Trycourier::DefaultPreferences::OrHash)
        ).void
      end
      attr_writer :default_preferences

      # Tenant's parent id (if any).
      sig { returns(T.nilable(String)) }
      attr_accessor :parent_tenant_id

      # Arbitrary properties accessible to a template.
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_accessor :properties

      # A user profile object merged with user profile on send.
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_accessor :user_profile

      sig do
        params(
          name: String,
          brand_id: T.nilable(String),
          default_preferences:
            T.nilable(Trycourier::DefaultPreferences::OrHash),
          parent_tenant_id: T.nilable(String),
          properties: T.nilable(T::Hash[Symbol, T.anything]),
          user_profile: T.nilable(T::Hash[Symbol, T.anything]),
          request_options: Trycourier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Name of the tenant.
        name:,
        # Brand to be used for the account when one is not specified by the send call.
        brand_id: nil,
        # Defines the preferences used for the tenant when the user hasn't specified their
        # own.
        default_preferences: nil,
        # Tenant's parent id (if any).
        parent_tenant_id: nil,
        # Arbitrary properties accessible to a template.
        properties: nil,
        # A user profile object merged with user profile on send.
        user_profile: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            name: String,
            brand_id: T.nilable(String),
            default_preferences: T.nilable(Trycourier::DefaultPreferences),
            parent_tenant_id: T.nilable(String),
            properties: T.nilable(T::Hash[Symbol, T.anything]),
            user_profile: T.nilable(T::Hash[Symbol, T.anything]),
            request_options: Trycourier::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
