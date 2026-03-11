# frozen_string_literal: true

module Courier
  module Models
    class JourneysInvokeRequest < Courier::Internal::Type::BaseModel
      # @!attribute data
      #   Data payload passed to the journey. The expected shape can be predefined using
      #   the schema builder in the journey editor. This data is available in journey
      #   steps for condition evaluation and template variable interpolation. Can also
      #   contain user identifiers (user_id, userId, anonymousId) if not provided
      #   elsewhere.
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :data, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown]

      # @!attribute profile
      #   Profile data for the user. Can contain contact information (email,
      #   phone_number), user identifiers (user_id, userId, anonymousId), or any custom
      #   profile fields. Profile fields are merged with any existing stored profile for
      #   the user. Include context.tenant_id to load a tenant-scoped profile for
      #   multi-tenant scenarios.
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :profile, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown]

      # @!attribute user_id
      #   A unique identifier for the user. If not provided, the system will attempt to
      #   resolve the user identifier from profile or data objects.
      #
      #   @return [String, nil]
      optional :user_id, String

      # @!method initialize(data: nil, profile: nil, user_id: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::JourneysInvokeRequest} for more details.
      #
      #   Request body for invoking a journey. Requires either a user identifier or a
      #   profile with contact information. User identifiers can be provided via user_id
      #   field, or resolved from profile/data objects (user_id, userId, or anonymousId
      #   fields).
      #
      #   @param data [Hash{Symbol=>Object}] Data payload passed to the journey. The expected shape can be predefined using t
      #
      #   @param profile [Hash{Symbol=>Object}] Profile data for the user. Can contain contact information (email, phone_number)
      #
      #   @param user_id [String] A unique identifier for the user. If not provided, the system will attempt to re
    end
  end
end
