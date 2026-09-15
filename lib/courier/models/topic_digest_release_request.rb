# frozen_string_literal: true

module Courier
  module Models
    class TopicDigestReleaseRequest < Courier::Internal::Type::BaseModel
      # @!attribute user_id
      #   The recipient whose digest to release. Required: there is no "release everyone
      #   on this topic" form, because a whole-schedule flush already has its own endpoint
      #   and a body-shaped difference between one recipient and all of them is too easy
      #   to get wrong.
      #
      #   @return [String]
      required :user_id, String

      # @!attribute tenant_id
      #   The recipient's tenant, when they were sent to as part of one -- the same value
      #   returned as `tenant_id` on a digest instance and sent as
      #   `message.context.tenant_id`. It is part of the held digest's key, so a tenanted
      #   recipient cannot be found without it. Omit for an ordinary recipient.
      #
      #   @return [String, nil]
      optional :tenant_id, String

      # @!method initialize(user_id:, tenant_id: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::TopicDigestReleaseRequest} for more details.
      #
      #   Which recipient's held digest to release.
      #
      #   @param user_id [String] The recipient whose digest to release. Required: there is no "release everyone o
      #
      #   @param tenant_id [String] The recipient's tenant, when they were sent to as part of one -- the same value
    end
  end
end
