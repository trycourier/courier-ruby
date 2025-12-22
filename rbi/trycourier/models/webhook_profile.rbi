# typed: strong

module Trycourier
  module Models
    class WebhookProfile < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::WebhookProfile, Trycourier::Internal::AnyHash)
        end

      # The URL to send the webhook request to.
      sig { returns(String) }
      attr_accessor :url

      # Authentication configuration for the webhook request.
      sig { returns(T.nilable(Trycourier::WebhookAuthentication)) }
      attr_reader :authentication

      sig do
        params(
          authentication: T.nilable(Trycourier::WebhookAuthentication::OrHash)
        ).void
      end
      attr_writer :authentication

      # Custom headers to include in the webhook request.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_accessor :headers

      # The HTTP method to use for the webhook request. Defaults to POST if not
      # specified.
      sig { returns(T.nilable(Trycourier::WebhookMethod::OrSymbol)) }
      attr_accessor :method_

      # Specifies what profile information is included in the request payload. Defaults
      # to 'limited' if not specified.
      sig { returns(T.nilable(Trycourier::WebhookProfileType::OrSymbol)) }
      attr_accessor :profile

      sig do
        params(
          url: String,
          authentication: T.nilable(Trycourier::WebhookAuthentication::OrHash),
          headers: T.nilable(T::Hash[Symbol, String]),
          method_: T.nilable(Trycourier::WebhookMethod::OrSymbol),
          profile: T.nilable(Trycourier::WebhookProfileType::OrSymbol)
        ).returns(T.attached_class)
      end
      def self.new(
        # The URL to send the webhook request to.
        url:,
        # Authentication configuration for the webhook request.
        authentication: nil,
        # Custom headers to include in the webhook request.
        headers: nil,
        # The HTTP method to use for the webhook request. Defaults to POST if not
        # specified.
        method_: nil,
        # Specifies what profile information is included in the request payload. Defaults
        # to 'limited' if not specified.
        profile: nil
      )
      end

      sig do
        override.returns(
          {
            url: String,
            authentication: T.nilable(Trycourier::WebhookAuthentication),
            headers: T.nilable(T::Hash[Symbol, String]),
            method_: T.nilable(Trycourier::WebhookMethod::OrSymbol),
            profile: T.nilable(Trycourier::WebhookProfileType::OrSymbol)
          }
        )
      end
      def to_hash
      end
    end
  end
end
