# typed: strong

module Courier
  module Models
    class AwsSns < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Courier::AwsSns, Courier::Internal::AnyHash) }

      # The ARN of the SNS platform endpoint, topic, or application to publish to.
      sig { returns(String) }
      attr_accessor :target_arn

      # Routes a push notification through the AWS SNS provider. The target ARN must be
      # nested under `aws_sns` — a top-level `target_arn` on the profile is ignored by
      # the provider.
      sig { params(target_arn: String).returns(T.attached_class) }
      def self.new(
        # The ARN of the SNS platform endpoint, topic, or application to publish to.
        target_arn:
      )
      end

      sig { override.returns({ target_arn: String }) }
      def to_hash
      end
    end
  end
end
