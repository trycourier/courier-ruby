# frozen_string_literal: true

module Trycourier
  module Models
    class TenantAssociation < Trycourier::Internal::Type::BaseModel
      # @!attribute tenant_id
      #   Tenant ID for the association between tenant and user
      #
      #   @return [String]
      required :tenant_id, String

      # @!attribute profile
      #   Additional metadata to be applied to a user profile when used in a tenant
      #   context
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :profile, Trycourier::Internal::Type::HashOf[Trycourier::Internal::Type::Unknown], nil?: true

      # @!attribute type
      #
      #   @return [Symbol, Trycourier::Models::TenantAssociation::Type, nil]
      optional :type, enum: -> { Trycourier::TenantAssociation::Type }, nil?: true

      # @!attribute user_id
      #   User ID for the association between tenant and user
      #
      #   @return [String, nil]
      optional :user_id, String, nil?: true

      # @!method initialize(tenant_id:, profile: nil, type: nil, user_id: nil)
      #   Some parameter documentations has been truncated, see
      #   {Trycourier::Models::TenantAssociation} for more details.
      #
      #   @param tenant_id [String] Tenant ID for the association between tenant and user
      #
      #   @param profile [Hash{Symbol=>Object}, nil] Additional metadata to be applied to a user profile when used in a tenant contex
      #
      #   @param type [Symbol, Trycourier::Models::TenantAssociation::Type, nil]
      #
      #   @param user_id [String, nil] User ID for the association between tenant and user

      # @see Trycourier::Models::TenantAssociation#type
      module Type
        extend Trycourier::Internal::Type::Enum

        USER = :user

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
