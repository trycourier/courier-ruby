# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Tenants#retrieve
    class Tenant < Courier::Internal::Type::BaseModel
      # @!attribute id
      #   Id of the tenant.
      #
      #   @return [String]
      required :id, String

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
      #   Defines the preferences used for the account when the user hasn't specified
      #   their own.
      #
      #   @return [Courier::Models::DefaultPreferences, nil]
      optional :default_preferences, -> { Courier::DefaultPreferences }, nil?: true

      # @!attribute parent_tenant_id
      #   Tenant's parent id (if any).
      #
      #   @return [String, nil]
      optional :parent_tenant_id, String, nil?: true

      # @!attribute properties
      #   Arbitrary properties accessible to a template.
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :properties, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown], nil?: true

      # @!attribute user_profile
      #   A user profile object merged with user profile on send.
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :user_profile, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown], nil?: true

      # @!method initialize(id:, name:, brand_id: nil, default_preferences: nil, parent_tenant_id: nil, properties: nil, user_profile: nil)
      #   Some parameter documentations has been truncated, see {Courier::Models::Tenant}
      #   for more details.
      #
      #   @param id [String] Id of the tenant.
      #
      #   @param name [String] Name of the tenant.
      #
      #   @param brand_id [String, nil] Brand to be used for the account when one is not specified by the send call.
      #
      #   @param default_preferences [Courier::Models::DefaultPreferences, nil] Defines the preferences used for the account when the user hasn't specified thei
      #
      #   @param parent_tenant_id [String, nil] Tenant's parent id (if any).
      #
      #   @param properties [Hash{Symbol=>Object}, nil] Arbitrary properties accessible to a template.
      #
      #   @param user_profile [Hash{Symbol=>Object}, nil] A user profile object merged with user profile on send.
    end
  end
end
