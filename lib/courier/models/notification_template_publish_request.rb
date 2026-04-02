# frozen_string_literal: true

module Courier
  module Models
    class NotificationTemplatePublishRequest < Courier::Internal::Type::BaseModel
      # @!attribute version
      #   Historical version to publish (e.g. "v001"). Omit to publish the current draft.
      #
      #   @return [String, nil]
      optional :version, String

      # @!method initialize(version: nil)
      #   Optional request body for publishing a notification template. Omit or send an
      #   empty object to publish the current draft.
      #
      #   @param version [String] Historical version to publish (e.g. "v001"). Omit to publish the current draft.
    end
  end
end
