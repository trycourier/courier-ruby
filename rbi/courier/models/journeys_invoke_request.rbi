# typed: strong

module Courier
  module Models
    class JourneysInvokeRequest < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::JourneysInvokeRequest, Courier::Internal::AnyHash)
        end

      # Data payload passed to the journey. The expected shape can be predefined using
      # the schema builder in the journey editor. This data is available in journey
      # steps for condition evaluation and template variable interpolation. Can also
      # contain user identifiers (user_id, userId, anonymousId) if not provided
      # elsewhere.
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_reader :data

      sig { params(data: T::Hash[Symbol, T.anything]).void }
      attr_writer :data

      # Profile data for the user. Can contain contact information (email,
      # phone_number), user identifiers (user_id, userId, anonymousId), or any custom
      # profile fields. Profile fields are merged with any existing stored profile for
      # the user. Include context.tenant_id to load a tenant-scoped profile for
      # multi-tenant scenarios.
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_reader :profile

      sig { params(profile: T::Hash[Symbol, T.anything]).void }
      attr_writer :profile

      # A unique identifier for the user. If not provided, the system will attempt to
      # resolve the user identifier from profile or data objects.
      sig { returns(T.nilable(String)) }
      attr_reader :user_id

      sig { params(user_id: String).void }
      attr_writer :user_id

      # Request body for invoking a journey. Requires either a user identifier or a
      # profile with contact information. User identifiers can be provided via user_id
      # field, or resolved from profile/data objects (user_id, userId, or anonymousId
      # fields).
      sig do
        params(
          data: T::Hash[Symbol, T.anything],
          profile: T::Hash[Symbol, T.anything],
          user_id: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Data payload passed to the journey. The expected shape can be predefined using
        # the schema builder in the journey editor. This data is available in journey
        # steps for condition evaluation and template variable interpolation. Can also
        # contain user identifiers (user_id, userId, anonymousId) if not provided
        # elsewhere.
        data: nil,
        # Profile data for the user. Can contain contact information (email,
        # phone_number), user identifiers (user_id, userId, anonymousId), or any custom
        # profile fields. Profile fields are merged with any existing stored profile for
        # the user. Include context.tenant_id to load a tenant-scoped profile for
        # multi-tenant scenarios.
        profile: nil,
        # A unique identifier for the user. If not provided, the system will attempt to
        # resolve the user identifier from profile or data objects.
        user_id: nil
      )
      end

      sig do
        override.returns(
          {
            data: T::Hash[Symbol, T.anything],
            profile: T::Hash[Symbol, T.anything],
            user_id: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
