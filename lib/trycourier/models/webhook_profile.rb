# frozen_string_literal: true

module Trycourier
  module Models
    class WebhookProfile < Trycourier::Internal::Type::BaseModel
      # @!attribute url
      #   The URL to send the webhook request to.
      #
      #   @return [String]
      required :url, String

      # @!attribute authentication
      #   Authentication configuration for the webhook request.
      #
      #   @return [Trycourier::Models::WebhookAuthentication, nil]
      optional :authentication, -> { Trycourier::WebhookAuthentication }, nil?: true

      # @!attribute headers
      #   Custom headers to include in the webhook request.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :headers, Trycourier::Internal::Type::HashOf[String], nil?: true

      # @!attribute method_
      #   The HTTP method to use for the webhook request. Defaults to POST if not
      #   specified.
      #
      #   @return [Symbol, Trycourier::Models::WebhookMethod, nil]
      optional :method_, enum: -> { Trycourier::WebhookMethod }, api_name: :method, nil?: true

      # @!attribute profile
      #   Specifies what profile information is included in the request payload. Defaults
      #   to 'limited' if not specified.
      #
      #   @return [Symbol, Trycourier::Models::WebhookProfileType, nil]
      optional :profile, enum: -> { Trycourier::WebhookProfileType }, nil?: true

      # @!method initialize(url:, authentication: nil, headers: nil, method_: nil, profile: nil)
      #   Some parameter documentations has been truncated, see
      #   {Trycourier::Models::WebhookProfile} for more details.
      #
      #   @param url [String] The URL to send the webhook request to.
      #
      #   @param authentication [Trycourier::Models::WebhookAuthentication, nil] Authentication configuration for the webhook request.
      #
      #   @param headers [Hash{Symbol=>String}, nil] Custom headers to include in the webhook request.
      #
      #   @param method_ [Symbol, Trycourier::Models::WebhookMethod, nil] The HTTP method to use for the webhook request. Defaults to POST if not specifie
      #
      #   @param profile [Symbol, Trycourier::Models::WebhookProfileType, nil] Specifies what profile information is included in the request payload. Defaults
    end
  end
end
