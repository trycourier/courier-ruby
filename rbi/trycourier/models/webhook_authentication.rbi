# typed: strong

module Trycourier
  module Models
    class WebhookAuthentication < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Trycourier::WebhookAuthentication,
            Trycourier::Internal::AnyHash
          )
        end

      # The authentication mode to use. Defaults to 'none' if not specified.
      sig { returns(Trycourier::WebhookAuthMode::OrSymbol) }
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
          mode: Trycourier::WebhookAuthMode::OrSymbol,
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
            mode: Trycourier::WebhookAuthMode::OrSymbol,
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
