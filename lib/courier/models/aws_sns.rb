# frozen_string_literal: true

module Courier
  module Models
    class AwsSns < Courier::Internal::Type::BaseModel
      # @!attribute target_arn
      #   The ARN of the SNS platform endpoint, topic, or application to publish to.
      #
      #   @return [String]
      required :target_arn, String

      # @!method initialize(target_arn:)
      #   Routes a push notification through the AWS SNS provider. The target ARN must be
      #   nested under `aws_sns` — a top-level `target_arn` on the profile is ignored by
      #   the provider.
      #
      #   @param target_arn [String] The ARN of the SNS platform endpoint, topic, or application to publish to.
    end
  end
end
