# frozen_string_literal: true

module Trycourier
  module Models
    # @see Trycourier::Resources::Tenants#update
    class TenantUpdateParams < Trycourier::Internal::Type::BaseModel
      extend Trycourier::Internal::Type::RequestParameters::Converter
      include Trycourier::Internal::Type::RequestParameters

      # @!attribute name
      #   Name of the tenant.
      #
      #   @return [String]
      required :name, String

      # @!attribute brand_id
      #   Brand to be used for the account when one is not specified by the send call.
      #
      #   @return [String, nil]
      optional :brand_id, String, nil?: true

      # @!attribute default_preferences
      #   Defines the preferences used for the tenant when the user hasn't specified their
      #   own.
      #
      #   @return [Trycourier::Models::DefaultPreferences, nil]
      optional :default_preferences, -> { Trycourier::DefaultPreferences }, nil?: true

      # @!attribute parent_tenant_id
      #   Tenant's parent id (if any).
      #
      #   @return [String, nil]
      optional :parent_tenant_id, String, nil?: true

      # @!attribute properties
      #   Arbitrary properties accessible to a template.
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :properties,
               Trycourier::Internal::Type::HashOf[Trycourier::Internal::Type::Unknown],
               nil?: true

      # @!attribute user_profile
      #   A user profile object merged with user profile on send.
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :user_profile,
               Trycourier::Internal::Type::HashOf[Trycourier::Internal::Type::Unknown],
               nil?: true

      # @!method initialize(name:, brand_id: nil, default_preferences: nil, parent_tenant_id: nil, properties: nil, user_profile: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Trycourier::Models::TenantUpdateParams} for more details.
      #
      #   @param name [String] Name of the tenant.
      #
      #   @param brand_id [String, nil] Brand to be used for the account when one is not specified by the send call.
      #
      #   @param default_preferences [Trycourier::Models::DefaultPreferences, nil] Defines the preferences used for the tenant when the user hasn't specified their
      #
      #   @param parent_tenant_id [String, nil] Tenant's parent id (if any).
      #
      #   @param properties [Hash{Symbol=>Object}, nil] Arbitrary properties accessible to a template.
      #
      #   @param user_profile [Hash{Symbol=>Object}, nil] A user profile object merged with user profile on send.
      #
      #   @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
