# typed: strong

module Courier
  module Models
    class TopicDigestReleaseRequest < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::TopicDigestReleaseRequest, Courier::Internal::AnyHash)
        end

      # The recipient whose digest to release. Required: there is no "release everyone
      # on this topic" form, because a whole-schedule flush already has its own endpoint
      # and a body-shaped difference between one recipient and all of them is too easy
      # to get wrong.
      sig { returns(String) }
      attr_accessor :user_id

      # The recipient's tenant, when they were sent to as part of one -- the same value
      # returned as `tenant_id` on a digest instance and sent as
      # `message.context.tenant_id`. It is part of the held digest's key, so a tenanted
      # recipient cannot be found without it. Omit for an ordinary recipient.
      sig { returns(T.nilable(String)) }
      attr_reader :tenant_id

      sig { params(tenant_id: String).void }
      attr_writer :tenant_id

      # Which recipient's held digest to release.
      sig do
        params(user_id: String, tenant_id: String).returns(T.attached_class)
      end
      def self.new(
        # The recipient whose digest to release. Required: there is no "release everyone
        # on this topic" form, because a whole-schedule flush already has its own endpoint
        # and a body-shaped difference between one recipient and all of them is too easy
        # to get wrong.
        user_id:,
        # The recipient's tenant, when they were sent to as part of one -- the same value
        # returned as `tenant_id` on a digest instance and sent as
        # `message.context.tenant_id`. It is part of the held digest's key, so a tenanted
        # recipient cannot be found without it. Omit for an ordinary recipient.
        tenant_id: nil
      )
      end

      sig { override.returns({ user_id: String, tenant_id: String }) }
      def to_hash
      end
    end
  end
end
