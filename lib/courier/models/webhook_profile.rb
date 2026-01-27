# frozen_string_literal: true

module Courier
  module Models
    class WebhookProfile < Courier::Internal::Type::BaseModel
      # @!attribute url
      #   The URL to send the webhook request to.
      #
      #   @return [String]
      required :url, String

      # @!attribute authentication
      #   Authentication configuration for the webhook request.
      #
      #   @return [Courier::Models::WebhookAuthentication, nil]
      optional :authentication, -> { Courier::WebhookAuthentication }, nil?: true

      # @!attribute headers
      #   Custom headers to include in the webhook request.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :headers, Courier::Internal::Type::HashOf[String], nil?: true

      # @!attribute method_
      #   The HTTP method to use for the webhook request. Defaults to POST if not
      #   specified.
      #
      #   @return [Symbol, Courier::Models::WebhookMethod, nil]
      optional :method_, enum: -> { Courier::WebhookMethod }, api_name: :method, nil?: true

      # @!attribute profile
      #   Specifies what profile information is included in the request payload. Defaults
      #   to 'limited' if not specified.
      #
      #   @return [Symbol, Courier::Models::WebhookProfileType, nil]
      optional :profile, enum: -> { Courier::WebhookProfileType }, nil?: true

      # @!method initialize(url:, authentication: nil, headers: nil, method_: nil, profile: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::WebhookProfile} for more details.
      #
      #   @param url [String] The URL to send the webhook request to.
      #
      #   @param authentication [Courier::Models::WebhookAuthentication, nil] Authentication configuration for the webhook request.
      #
      #   @param headers [Hash{Symbol=>String}, nil] Custom headers to include in the webhook request.
      #
      #   @param method_ [Symbol, Courier::Models::WebhookMethod, nil] The HTTP method to use for the webhook request. Defaults to POST if not specifie
      #
      #   @param profile [Symbol, Courier::Models::WebhookProfileType, nil] Specifies what profile information is included in the request payload. Defaults
    end
  end
end
