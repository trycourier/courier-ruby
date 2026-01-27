# typed: strong

module Courier
  module Models
    class WebhookAuthentication < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::WebhookAuthentication, Courier::Internal::AnyHash)
        end

      # The authentication mode to use. Defaults to 'none' if not specified.
      sig { returns(Courier::WebhookAuthMode::OrSymbol) }
      attr_accessor :mode

      # Token for bearer authentication.
      sig { returns(T.nilable(String)) }
      attr_accessor :token

      # Password for basic authentication.
      sig { returns(T.nilable(String)) }
      attr_accessor :password

      # Username for basic authentication.
      sig { returns(T.nilable(String)) }
      attr_accessor :username

      sig do
        params(
          mode: Courier::WebhookAuthMode::OrSymbol,
          token: T.nilable(String),
          password: T.nilable(String),
          username: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # The authentication mode to use. Defaults to 'none' if not specified.
        mode:,
        # Token for bearer authentication.
        token: nil,
        # Password for basic authentication.
        password: nil,
        # Username for basic authentication.
        username: nil
      )
      end

      sig do
        override.returns(
          {
            mode: Courier::WebhookAuthMode::OrSymbol,
            token: T.nilable(String),
            password: T.nilable(String),
            username: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
