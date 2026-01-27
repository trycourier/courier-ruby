# typed: strong

module Courier
  module Models
    class Tenant < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Courier::Tenant, Courier::Internal::AnyHash) }

      # Id of the tenant.
      sig { returns(String) }
      attr_accessor :id

      # Name of the tenant.
      sig { returns(String) }
      attr_accessor :name

      # Brand to be used for the account when one is not specified by the send call.
      sig { returns(T.nilable(String)) }
      attr_accessor :brand_id

      # Defines the preferences used for the account when the user hasn't specified
      # their own.
      sig { returns(T.nilable(Courier::DefaultPreferences)) }
      attr_reader :default_preferences

      sig do
        params(
          default_preferences: T.nilable(Courier::DefaultPreferences::OrHash)
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
          id: String,
          name: String,
          brand_id: T.nilable(String),
          default_preferences: T.nilable(Courier::DefaultPreferences::OrHash),
          parent_tenant_id: T.nilable(String),
          properties: T.nilable(T::Hash[Symbol, T.anything]),
          user_profile: T.nilable(T::Hash[Symbol, T.anything])
        ).returns(T.attached_class)
      end
      def self.new(
        # Id of the tenant.
        id:,
        # Name of the tenant.
        name:,
        # Brand to be used for the account when one is not specified by the send call.
        brand_id: nil,
        # Defines the preferences used for the account when the user hasn't specified
        # their own.
        default_preferences: nil,
        # Tenant's parent id (if any).
        parent_tenant_id: nil,
        # Arbitrary properties accessible to a template.
        properties: nil,
        # A user profile object merged with user profile on send.
        user_profile: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            name: String,
            brand_id: T.nilable(String),
            default_preferences: T.nilable(Courier::DefaultPreferences),
            parent_tenant_id: T.nilable(String),
            properties: T.nilable(T::Hash[Symbol, T.anything]),
            user_profile: T.nilable(T::Hash[Symbol, T.anything])
          }
        )
      end
      def to_hash
      end
    end
  end
end
