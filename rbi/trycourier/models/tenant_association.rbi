# typed: strong

module Trycourier
  module Models
    class TenantAssociation < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::TenantAssociation, Trycourier::Internal::AnyHash)
        end

      # Tenant ID for the association between tenant and user
      sig { returns(String) }
      attr_accessor :tenant_id

      # Additional metadata to be applied to a user profile when used in a tenant
      # context
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_accessor :profile

      sig { returns(T.nilable(Trycourier::TenantAssociation::Type::OrSymbol)) }
      attr_accessor :type

      # User ID for the association between tenant and user
      sig { returns(T.nilable(String)) }
      attr_accessor :user_id

      sig do
        params(
          tenant_id: String,
          profile: T.nilable(T::Hash[Symbol, T.anything]),
          type: T.nilable(Trycourier::TenantAssociation::Type::OrSymbol),
          user_id: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # Tenant ID for the association between tenant and user
        tenant_id:,
        # Additional metadata to be applied to a user profile when used in a tenant
        # context
        profile: nil,
        type: nil,
        # User ID for the association between tenant and user
        user_id: nil
      )
      end

      sig do
        override.returns(
          {
            tenant_id: String,
            profile: T.nilable(T::Hash[Symbol, T.anything]),
            type: T.nilable(Trycourier::TenantAssociation::Type::OrSymbol),
            user_id: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      module Type
        extend Trycourier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Trycourier::TenantAssociation::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        USER = T.let(:user, Trycourier::TenantAssociation::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Trycourier::TenantAssociation::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
